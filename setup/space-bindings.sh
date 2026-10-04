#!/bin/bash
# Assign apps to desktops (Spaces) on the main display.
#
# Part of new-machine setup (see README); run it by hand after creating the
# desktops in Mission Control. macOS stores these bindings against per-machine
# desktop UUIDs, so this looks up the UUID of "Desktop N" on this Mac. Only
# writes (and restarts the Dock) when something differs, so re-running is safe.
set -euo pipefail

if [ "$(uname -s)" != "Darwin" ]; then
  echo "$(basename "$0"): macOS only, skipping" >&2
  exit 0
fi

osascript -l JavaScript <<'JS'
ObjC.import('Foundation');

// bundle id -> desktop number on the main display, or "all"
const BINDINGS = {
  'com.apple.finder': 'all',
  'com.readdle.smartemail-mac': 2,      // Spark
  'com.flexibits.fantastical2.mac': 2,  // Fantastical
  'com.pixelmatorteam.pixelmator.x': 3, // Pixelmator Pro
  'com.apple.music': 4,
};

const app = Application.currentApplication();
app.includeStandardAdditions = true;
const sh = (cmd) => app.doShellScript(cmd);
const q = (s) => "'" + String(s).replace(/'/g, "'\\''") + "'";

const prefs = $.NSUserDefaults.alloc.initWithSuiteName('com.apple.spaces');
const config = ObjC.deepUnwrap(prefs.objectForKey('SpacesDisplayConfiguration')) || {};
const monitors = ((config['Management Data'] || {}).Monitors) || [];
const main = monitors.find((m) => m['Display Identifier'] === 'Main') || monitors[0];
const uuids = ((main && main.Spaces) || []).map((s) => s.uuid);

const needed = Math.max(...Object.values(BINDINGS).filter((v) => v !== 'all'));
if (uuids.length < needed) {
  console.log(`space-bindings: found ${uuids.length} desktop(s), need ${needed}. ` +
              'Add desktops in Mission Control, then run this script again.');
} else {
  const current = ObjC.deepUnwrap(prefs.objectForKey('app-bindings')) || {};
  const changes = [];
  for (const [bundle, target] of Object.entries(BINDINGS)) {
    const want = target === 'all' ? 'AllSpaces' : uuids[target - 1];
    if (current[bundle] !== want) changes.push(q(bundle), q(want));
  }
  if (changes.length) {
    sh('defaults write com.apple.spaces app-bindings -dict-add ' + changes.join(' '));
    sh('killall Dock || true');
    console.log(`space-bindings: updated ${changes.length / 2} app binding(s)`);
  }
}
JS

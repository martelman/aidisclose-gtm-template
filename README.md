# AIDisclose — Google Tag Manager Custom Template

Loads the dependency-free [`aidisclose.js`](https://aidisclose.io/docs/snippet/) snippet through Google Tag Manager: the EU AI Act Article 50 / California SB 942 interaction-disclosure banner, visible AI-content labels, and a machine-readable manifest pointer, localized in 28 languages. Cookieless, no tracking.

## Files

- `template.tpl` — the sandboxed GTM Custom Template.
- `metadata.yaml` — gallery metadata (fill in the commit SHA before submitting).
- `LICENSE` — MIT.

## Publish to the Community Template Gallery

The gallery reads a **dedicated public repo** with these files at the root (one template per repo). Do not put this inside the main snippet repo.

1. Create a new public GitHub repo, e.g. `aidisclose-gtm-template`.
2. Copy `template.tpl`, `metadata.yaml`, and `LICENSE` to its root and push.
3. Set `metadata.yaml` → `versions[0].sha` to the pushed commit SHA.
4. Import `template.tpl` into GTM (Templates → New → import) and run **Preview/Tests** to confirm it injects the script cleanly.
5. Submit at the [Community Template Gallery](https://tagmanager.google.com/gallery/) → "Submit your template", pointing at the repo. Google reviews the sandboxed code and permissions (a few days).

## Using it (for GTM users, once listed)

New Tag → choose from the gallery → search "AIDisclose" → set the trigger to **All Pages**. Optional: a site key (otherwise it auto-reads `/.well-known/ai-disclosure.json`) and a theme.

## Permissions the template requests

- `inject_script` → `https://cdn.aidisclose.io/v1/aidisclose.js`
- `access_globals` → read/write `AIDiscloseConfig`

Nothing else. No cookies, no data collection by the template.

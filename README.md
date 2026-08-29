# nexvorai portfolio + hidden admin

- Removed all visible Admin links from the public page.
- `admin.html` now has `noindex,nofollow,noarchive` and must be opened directly.
- Replaced the previous logo artwork with a clear `N` brand mark in `assets/logo.svg`.
- Portfolio projects added in the admin panel appear on the public site through browser localStorage.
- Metrics count from zero to 1,400+, 380M, 36h and 94% when scrolled into view.

## Admin
Open `admin.html` directly, create an 8+ character password and add hosted MP4 projects. Delete projects from the same panel. The public site intentionally has no admin link.

## Security
This is a browser-only static admin gate, not server-side authentication. It is suitable for a portfolio preview; use a real backend/authentication system for production data.

## Logo
Replace `assets/logo.svg` with the final nexvorai logo. The current placeholder contains an `N`.

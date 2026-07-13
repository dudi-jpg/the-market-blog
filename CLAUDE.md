# The Market — Project Guide (for Claude)

Hebrew (RTL) business/economy magazine, **TheMarker-style**. Static Astro 5 site. Built by cloning the Auto Times engine and rebranding.

## Stack & hosting
- Astro 5, content collections, fonts Rubik (headings) + Assistant (body).
- Articles = Markdown in `src/content/articles/`.
- Deploy: GitHub (account dudi@adgpt.com / **dudi-jpg**, SSH) → Cloudflare Pages. Build `npm run build`, output `dist`.

## Brand
- Palette: TheMarker-style **green** `--accent: #00a24a` + near-black `--ink/--navy: #16181d` + white. Red/green for market up/down (`--up`/`--down`).
- Logo: "TheMarket" wordmark on a green brush (`src/components/Logo.astro`).
- Categories: שוק ההון · כלכלה · טכנולוגיה · נדל"ן · צרכנות (edit in `src/consts.ts` + enum in `src/content.config.ts`).
- Home has a `MarketTicker.astro` strip (static demo indices — wire to a live feed later).

## Commands
- `npm run dev` → http://localhost:4321 · `npm run build` / `npm run preview`

## Daily automation (5 articles/day)
- `scripts/generate-daily.mjs` — Anthropic API (`claude-opus-4-8`, adaptive thinking, structured outputs) → pro Hebrew business/economy articles (SEO+GEO: focus keyword, meta, TL;DR, data table, FAQ). Images from Wikimedia Commons (relevance-matched), generic per-category fallbacks.
- GitHub Actions cron `.github/workflows/daily-articles.yml` (05:00 UTC ≈ 08:00 Israel). Needs repo secret **ANTHROPIC_API_KEY**. Manual: `ANTHROPIC_API_KEY=... ARTICLES_PER_RUN=n npm run generate:daily`.
- SEO/GEO: sitemap, robots.txt, /rss.xml, JSON-LD (NewsArticle+FAQPage+Breadcrumb+Organization+WebSite).

## Conventions
- Hebrew, RTL. Address the user in Hebrew masculine. Article images always render 16:9 (`height:auto` + `aspect-ratio`).

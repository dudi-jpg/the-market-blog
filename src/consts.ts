// הגדרות כלליות של האתר — נקודה אחת לעריכה של שם, סלוגן וקטגוריות.
export const SITE_TITLE = 'The Market';
export const SITE_TAGLINE = 'כל מה שמניע את הכלכלה — שוק ההון, עסקים, טכנולוגיה וצרכנות';
export const SITE_DESCRIPTION =
  'The Market — מגזין הכלכלה והעסקים בעברית. חדשות שוק ההון, כלכלה, טכנולוגיה, נדל״ן וצרכנות, ניתוחים ומדריכים למשקיע ולצרכן הישראלי.';

// סדר הקטגוריות בתפריט. חייב להתאים לערכים ב-content.config.ts
export const CATEGORIES = ['שוק ההון', 'כלכלה', 'טכנולוגיה', 'נדל"ן', 'צרכנות'] as const;
export type Category = (typeof CATEGORIES)[number];

// כמה כתבות מציגים בעמוד (ארכיון + עמודי קטגוריה)
export const PAGE_SIZE = 12;

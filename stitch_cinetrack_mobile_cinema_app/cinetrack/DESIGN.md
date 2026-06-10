---
name: CineTrack
colors:
  surface: '#19120a'
  surface-dim: '#19120a'
  surface-bright: '#41382e'
  surface-container-lowest: '#140d06'
  surface-container-low: '#221a12'
  surface-container: '#261e15'
  surface-container-high: '#31281f'
  surface-container-highest: '#3c3329'
  on-surface: '#f0e0d1'
  on-surface-variant: '#d8c3ad'
  inverse-surface: '#f0e0d1'
  inverse-on-surface: '#382f25'
  outline: '#a08e7a'
  outline-variant: '#534434'
  surface-tint: '#ffb95f'
  primary: '#ffc174'
  on-primary: '#472a00'
  primary-container: '#f59e0b'
  on-primary-container: '#613b00'
  inverse-primary: '#855300'
  secondary: '#bcc7de'
  on-secondary: '#263143'
  secondary-container: '#3e495d'
  on-secondary-container: '#aeb9d0'
  tertiary: '#8fd5ff'
  on-tertiary: '#00344a'
  tertiary-container: '#1abdff'
  on-tertiary-container: '#004966'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#ffddb8'
  primary-fixed-dim: '#ffb95f'
  on-primary-fixed: '#2a1700'
  on-primary-fixed-variant: '#653e00'
  secondary-fixed: '#d8e3fb'
  secondary-fixed-dim: '#bcc7de'
  on-secondary-fixed: '#111c2d'
  on-secondary-fixed-variant: '#3c475a'
  tertiary-fixed: '#c5e7ff'
  tertiary-fixed-dim: '#7fd0ff'
  on-tertiary-fixed: '#001e2d'
  on-tertiary-fixed-variant: '#004c6a'
  background: '#19120a'
  on-background: '#f0e0d1'
  surface-variant: '#3c3329'
typography:
  display-lg:
    fontFamily: Montserrat
    fontSize: 48px
    fontWeight: '700'
    lineHeight: 56px
    letterSpacing: -0.02em
  display-lg-mobile:
    fontFamily: Montserrat
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
    letterSpacing: -0.01em
  headline-md:
    fontFamily: Montserrat
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 32px
  headline-sm:
    fontFamily: Montserrat
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
  body-lg:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '400'
    lineHeight: 28px
  body-md:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  label-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '500'
    lineHeight: 20px
    letterSpacing: 0.01em
  label-sm:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 16px
    letterSpacing: 0.05em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  base: 8px
  xs: 4px
  sm: 12px
  md: 24px
  lg: 40px
  xl: 64px
  gutter: 24px
  margin-mobile: 16px
  margin-desktop: 48px
---

## Brand & Style
The design system is engineered for a premium, media-centric movie tracking experience. It utilizes a **Dark Cinematic** aesthetic that prioritizes high-fidelity visuals and immersive content discovery. The brand personality is sophisticated and authoritative, yet accessible, mirroring the atmosphere of a high-end digital theater. 

Key style elements include:
- **Cinematic Depth:** Utilizing a dark palette to let movie poster art and high-resolution stills provide the primary visual interest.
- **Modern Minimalism:** Clean layouts with generous negative space to reduce cognitive load while browsing large catalogs.
- **Premium Accents:** Strategic use of vivid amber to guide users toward high-value actions like ratings and ticket purchases.

## Colors
The color palette is built on a "Deep Midnight" foundation to ensure maximum contrast for media content and reduce eye strain in low-light environments.

- **Primary (Vivid Amber):** Reserved for active states, call-to-action buttons, and numerical ratings. It signifies energy and prestige.
- **Secondary (Slate Blue):** Used for elevated surfaces such as cards, sidebars, and input fields to create a subtle layered effect against the background.
- **Neutrals:** Text scales from Pure White for primary readability to Cool Gray for metadata and captions, ensuring a clear information hierarchy.

## Typography
This design system pairs the bold, geometric presence of **Montserrat** for headings with the systematic clarity of **Inter** for UI elements and long-form descriptions.

- **Headlines:** Use high-contrast Montserrat to establish a cinematic feel. Large display styles should utilize tighter letter-spacing to feel more "editorial."
- **Body & Metadata:** Inter provides exceptional legibility at small sizes, crucial for technical details like cast lists, runtimes, and release dates.
- **Caps & Labels:** Use small-caps or uppercase Inter for categories and tags to provide architectural structure to the content-heavy layout.

## Layout & Spacing
The layout follows a **fluid grid** model with a focus on horizontal scrolling sections (carousels) to mimic modern streaming platforms.

- **Grid:** Use a 12-column grid for desktop and a 4-column grid for mobile.
- **Rhythm:** An 8px linear scale governs all padding and margins, ensuring vertical rhythm between movie titles, ratings, and descriptions.
- **Safe Zones:** Content should maintain a minimum 48px margin on desktop to maintain the "premium" wide-screen feel, while mobile scales down to 16px to maximize screen real estate for movie posters.

## Elevation & Depth
Depth is achieved through **tonal layering** rather than traditional drop shadows, though soft, ambient shadows are used for the highest-level components.

- **Base Layer:** Deep Midnight (#0F172A) serves as the canvas.
- **Level 1 (Cards/Surfaces):** Slate Blue (#1E293B) creates the first level of elevation.
- **Level 2 (Modals/Popovers):** A slightly lighter tint of Slate Blue with a 20% opacity blur shadow (Color: #000000, Blur: 24px, Y: 12px) to suggest the element is floating.
- **Glassmorphism:** Use background blurs (12px - 20px) on navigation bars and persistent headers to maintain context of the content behind them while scrolling.

## Shapes
The design system uses a **Rounded** (16px/1rem) language to soften the dark aesthetic and make the interface feel modern and approachable.

- **Primary Surfaces:** Movie posters and main cards use the base 16px radius.
- **Buttons & Chips:** Follow a "Soft" to "Rounded" logic depending on size, but always avoid sharp corners.
- **Interactive Elements:** Active states should be reinforced by subtle inner-glows or border-radius consistency across nested elements.

## Components
- **Buttons:** Primary buttons use a solid Vivid Amber background with dark text. Secondary buttons are "ghost" style with Slate Blue borders.
- **Movie Cards:** Vertical aspect ratio (2:3). Features a 16px corner radius. The rating badge (Amber) is pinned to the top-right corner.
- **Chips/Tags:** Used for genres and filters. These utilize a semi-transparent Slate Blue fill with Cool Gray text, shifting to Amber text when active.
- **Progress Bars:** Used for watch-time tracking. Use a thin 4px height with a Slate Blue track and an Amber fill.
- **Input Fields:** Darker than the card surfaces to provide a "recessed" feel. Borders should be invisible unless the field is focused, at which point an Amber ring appears.
- **Ratings:** Use a custom star iconography or a circular progress ring in Vivid Amber to emphasize the community/score aspect.
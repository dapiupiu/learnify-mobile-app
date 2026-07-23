---
name: Cheerful Growth
colors:
  surface: '#f7f9fb'
  surface-dim: '#d8dadc'
  surface-bright: '#f7f9fb'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f2f4f6'
  surface-container: '#eceef0'
  surface-container-high: '#e6e8ea'
  surface-container-highest: '#e0e3e5'
  on-surface: '#191c1e'
  on-surface-variant: '#3f484c'
  inverse-surface: '#2d3133'
  inverse-on-surface: '#eff1f3'
  outline: '#6f787d'
  outline-variant: '#bfc8cd'
  surface-tint: '#0c6780'
  primary: '#0c6780'
  on-primary: '#ffffff'
  primary-container: '#87ceeb'
  on-primary-container: '#005870'
  inverse-primary: '#89d0ed'
  secondary: '#4b53bc'
  on-secondary: '#ffffff'
  secondary-container: '#8991fe'
  on-secondary-container: '#1b218f'
  tertiary: '#904d00'
  on-tertiary: '#ffffff'
  tertiary-container: '#ffb477'
  on-tertiary-container: '#7d4200'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#baeaff'
  primary-fixed-dim: '#89d0ed'
  on-primary-fixed: '#001f29'
  on-primary-fixed-variant: '#004d62'
  secondary-fixed: '#e0e0ff'
  secondary-fixed-dim: '#bfc2ff'
  on-secondary-fixed: '#00006e'
  on-secondary-fixed-variant: '#3239a3'
  tertiary-fixed: '#ffdcc3'
  tertiary-fixed-dim: '#ffb77d'
  on-tertiary-fixed: '#2f1500'
  on-tertiary-fixed-variant: '#6e3900'
  background: '#f7f9fb'
  on-background: '#191c1e'
  surface-variant: '#e0e3e5'
typography:
  display-lg:
    fontFamily: Quicksand
    fontSize: 48px
    fontWeight: '700'
    lineHeight: 56px
    letterSpacing: -0.02em
  display-lg-mobile:
    fontFamily: Quicksand
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
    letterSpacing: -0.02em
  headline-md:
    fontFamily: Quicksand
    fontSize: 24px
    fontWeight: '700'
    lineHeight: 32px
  body-lg:
    fontFamily: Quicksand
    fontSize: 20px
    fontWeight: '500'
    lineHeight: 28px
  body-md:
    fontFamily: Quicksand
    fontSize: 18px
    fontWeight: '500'
    lineHeight: 26px
  label-bold:
    fontFamily: Quicksand
    fontSize: 16px
    fontWeight: '700'
    lineHeight: 20px
rounded:
  sm: 0.5rem
  DEFAULT: 1rem
  md: 1.5rem
  lg: 2rem
  xl: 3rem
  full: 9999px
spacing:
  unit: 8px
  gutter: 24px
  margin-mobile: 24px
  margin-desktop: 64px
  touch-target-min: 56px
---

## Brand & Style
The design system is built to evoke joy, safety, and curiosity for early childhood learners. It prioritizes high-tactile feedback and "squishable" aesthetics to mirror physical toys. 

The style is a blend of **Tactile Neomorphism** and **Playful Minimalism**. It utilizes exaggerated rounded corners, thick outlines, and subtle 3D depth to make every interface element feel like a physical button that begs to be pressed. The visual language uses soft sky-like motifs—clouds for containers and stars for achievements—to create a nurturing digital environment.

## Colors
This design system uses a high-contrast, vibrant palette designed for clarity and emotional engagement.

- **Primary (Sky Blue):** Used for large surface areas, backgrounds, and friendly "safe" actions. It provides a calm, airy feel.
- **Secondary (Navy Blue):** Reserved for text, iconography, and "grounding" elements like thick borders. It ensures maximum legibility and structural hierarchy.
- **Tertiary (Mascot Orange):** The "Call to Adventure" color. Used for high-priority interactive elements, progress indicators, and celebratory feedback.
- **Semantic Success:** A bright Mint Green (#4ADE80) for correct answers.
- **Semantic Error:** A soft Watermelon Red (#FB7185) for gentle guidance when a child needs to try again.

## Typography
Typography is treated as a graphic element. **Quicksand** is used exclusively for its rounded terminals and open counters, which mimic the way children are taught to write. 

- **Weight Usage:** Bold weights are the default for all interactive labels and headers to ensure visibility against vibrant backgrounds.
- **Legibility:** Line heights are generous (1.4x+) to prevent visual crowding for young readers or pre-readers.
- **Hierarchy:** Size differentials are aggressive to help children instinctively understand the "Big Idea" of each screen.

## Layout & Spacing
The layout follows a **Fluid Safety Grid**. Because the target audience has developing fine motor skills, "white space" is treated as "breathing room" to prevent accidental taps.

- **Touch Targets:** No interactive element should be smaller than 56px.
- **Guttering:** 24px minimum between cards to maintain the "3D" separation.
- **Mobile First:** Content is primarily vertically stacked or arranged in 2-column large-tiled grids.
- **Safe Areas:** Generous margins (24px+) ensure that small hands holding the device do not obscure critical content.

## Elevation & Depth
Depth in this design system is structural rather than atmospheric. We avoid traditional blurry shadows in favor of **Lego-style 3D offsets**.

- **The "Lift":** Interactive elements feature a solid 4px to 8px bottom border (usually a darker shade of the element's color) to simulate physical thickness.
- **Active State:** On press, the element should translate Y+4px and the bottom border should shrink, simulating a physical button being pushed down.
- **Floating Elements:** Clouds and decorative stars use a soft, low-opacity Navy Blue shadow with a 0px blur and 4px offset to appear "pinned" to the sky.

## Shapes
The shape language is extremely soft and organic. There are no sharp corners in the design system.

- **Base Radius:** 24px (rounded-xl) is the standard for cards and primary buttons.
- **Pill Shapes:** Used for navigation chips and secondary buttons to differentiate from primary square-ish cards.
- **Container Styling:** Containers should often use "Cloud" styling—multiple overlapping circles—rather than standard rectangles.

## Components

### Buttons
Primary buttons use Mascot Orange with a Navy Blue 4px solid "bottom-depth" border. Labels are always `label-bold`. The "Squish" effect (downward movement on tap) is mandatory.

### 3D Cards
Cards use a white or pale Sky Blue background with a 3px Navy Blue outline and an 8px solid depth-shadow. Cards for activities should include a large central icon or illustration.

### Progress Stars
Instead of a linear bar, progress is shown via a row of "Empty Star" outlines that fill with Mascot Orange and a "pop" animation when a task is completed.

### Input Fields
Inputs are oversized (64px height) with a thick Navy Blue border and 32px rounded corners. The focus state changes the border from Navy to Mascot Orange.

### Navigation Toggles
Large, chunky toggle switches that look like physical levers. They use high-contrast color shifts (Sky Blue for 'Off', Orange for 'On') to clearly indicate state without needing to read text.
# Roche Potential Plotter (`PlotRoche`)

This IDL script calculates and visualizes the **Roche potential** for a binary star system using a 2D grid and contour plotting.

## Description

The Roche potential represents the combined effects of gravitational and centrifugal forces in a rotating frame co-rotating with a binary star system. This visualization helps identify regions like **Roche lobes**, **Lagrange points**, and equipotential surfaces in the system.

## Features

- Calculates the Roche potential for a given mass ratio `q`
- High-resolution 2D grid (1000x1000)
- Gravitational potential contributions from both stars
- Centrifugal potential in a rotating frame
- Cutoff applied to avoid singularities near stellar centers
- Generates a contour plot of the Roche potential field
- Saves output plot as PostScript file `roche.ps`

## Parameters

- `q`: Mass ratio \( M_2 / M_1 \) of the binary system. Default: `0.25`
- `a`: Binary separation. Default: `1.0`
- `G`: Gravitational constant. Default: `1.0` (normalized units)
- `NUM`: Grid resolution. Default: `1000`

## How to Use

1. Open IDL or an IDL-compatible environment.
2. Run the `PlotRoche` script.
3. The script will:
   - Compute the Roche potential on a 2D grid
   - Generate a contour plot with 150 levels
   - Save the plot as `roche.ps`

## Output

- **Contour Plot**: Shows the Roche potential field in the x-y plane.
- **File**: `roche.ps` — a PostScript file of the plotted potential.

## Notes

- The stars are positioned along the x-axis with:
  - M1 at \( x = -\frac{a}{q+1} \)
  - M2 at \( x = +\frac{aq}{q+1} \)
- Extreme values near the center of each star are capped to avoid singularities.
- The title of the plot may say `q = 1` but make sure to change it to reflect your actual input value for `q`.

## Example Visualization

*(You can include an example image here if you convert the .ps file to a .png or .jpg)*

## License

This script is provided for educational and research purposes.

---


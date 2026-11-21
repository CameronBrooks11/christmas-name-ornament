default:
    @just --list

# Render the ornament in each test case and preset, and check its solids and size
test:
    python3 tests/test_ornament.py

# Everything CI runs, bar the tests
check: fmt-check

# Format the .scad sources with topiary (.topiary/languages.ncl)
fmt:
    git ls-files -z '*.scad' | xargs -0 -r topiary format

# Check the .scad sources are formatted, without changing them
fmt-check:
    git ls-files -z '*.scad' | xargs -0 -r -n1 topiary format --check

# Render the README pictures into assets/, in Liberation Sans
images:
    @mkdir -p assets
    openscad --render --camera=0,3,0,0,0,0,235 --imgsize=600,640 --colorscheme=Tomorrow -D font_name=0 -D 'other_font="Liberation Sans"' -o assets/ornament.png src/ornament.scad
    openscad --render --camera=0,3,0,0,0,0,235 --imgsize=600,640 --colorscheme=Tomorrow -D font_name=0 -D 'other_font="Liberation Sans"' -D 'name="Christopher"' -o assets/ornament-long-name.png src/ornament.scad

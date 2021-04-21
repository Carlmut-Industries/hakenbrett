$fn = 128;

module hakenbrett(names) {
    
    width = 100 * len(names);
    
    // Base plate
    color("black")
    cube([width, 100, 5]);
    
    // Top decoration
    color("gold")
    translate([0, 0, 5]) {
        // Place names
        for (i = [0 : len(names) - 1]) {
            translate([i * 100 + 50, 62.5, 0]) {
                linear_extrude(1)
                text(names[i], font="Tex Gyre Pagella:style=Bold", size=20, halign="center");
                // Hook
                translate([0, -32.5, 0])
                cylinder(d = 9.5, h = 100);
            }
        }
        
        // Outline
        difference() {
            cube([width, 100, 1]);
            translate([1, 1, 0])
            cube([width - 2, 100 - 2, 1]);
        }
    }
    
}

hakenbrett(["Carl", "Eddi"]);

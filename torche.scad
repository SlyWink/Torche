diam_torche=24.4+0.5; ray_torche=diam_torche/2;
larg_torche=22.2+0.4;
long_torche=50;

dia0_ecrou0=5+0.3; dia1_ecrou0=11.2+0.5; haut_ecrou0=4.6+0.3;
dia0_ecrou1=3+0.3; dia1_ecrou1=6.2+0.5; haut_ecrou1=3+0.3; // A VERIFIER
deca_ecrou1=2; dia2_ecrou1=dia1_ecrou1+deca_ecrou1*2;

diam_base=diam_torche; ray_base=diam_base/2;
hau0_base=2;
hau1_base=haut_ecrou0+hau0_base;


module Corps_Torche() {
  color("Blue") intersection() {
    cylinder(r=ray_torche,h=long_torche,center=true);
    cube([larg_torche,diam_torche+0.2,long_torche+0.2],center=true);
  }
}


module Base_Support() {
  difference() {
    union() {
      cylinder(r=ray_base,h=hau1_base);
      hull() {
        translate([(larg_torche+dia2_ecrou1)/2,0,0]) cylinder(r=dia2_ecrou1/2,h=hau1_base);
        translate([-(larg_torche+dia2_ecrou1)/2,0,0]) cylinder(r=dia2_ecrou1/2,h=hau1_base);
      }
      translate([0,0,hau1_base-0.1]) intersection() {
        translate([-larg_torche/2,-ray_torche-0.1,0]) cube([larg_torche,diam_torche+0.2,ray_torche]);
        translate([0,0,-0.1]) cylinder(r=ray_torche,h=ray_torche+0.2);
      }
    }
    translate([0,0,ray_torche+hau1_base])
      rotate([90,0,0]) cylinder(r=ray_torche,h=diam_torche+0.2,center=true);
    translate([0,0,hau0_base])
      rotate([0,0,90]) cylinder(r=dia1_ecrou0/2,h=hau1_base,$fn=6);
    translate([0,0,-0.1]) cylinder(r=dia0_ecrou0/2,h=hau1_base);
    translate([(larg_torche+dia2_ecrou1)/2,0,-0.1]) {
      cylinder(r=dia1_ecrou1/2,h=hau1_base-hau0_base+0.1,$fn=6);
      cylinder(r=dia0_ecrou1/2,h=hau1_base+0.2);
    }
    translate([-(larg_torche+dia2_ecrou1)/2,0,-0.1]) {
      cylinder(r=dia1_ecrou1/2,h=hau1_base-hau0_base+0.1,$fn=6);
      cylinder(r=dia0_ecrou1/2,h=hau1_base+0.2);
    }

  }
}

echo(dia2_ecrou1);
Base_Support();
//#translate([0,0,hau1_base+diam_torche/2]) rotate([90,0,0]) Corps_Torche();
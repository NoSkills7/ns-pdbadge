# ns-pdbadge
A simple script to issue and show PD badges through text chat. Utilizes ox_inventory/ox_lib.

Item for ox_inventory :
	['pdbadge'] = {
		label = 'Police Badge',
		weight = 1,
		stack = false,
		close = false,
		description = "A police badge containing all your information to identify yourself as a officer."
	},

Animation used :

 ["idcardb"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 2 - FIB",
        AnimationOptions = {
            Prop = "prop_fib_badge",
            PropBone = 28422,
            PropPlacement = {
                0.0600,
                0.0210,
                -0.0400,
                -90.00,
                -180.00,
                78.999
            },
            EmoteLoop = false,
            EmoteMoving = true,
        }
    },

Config = {}


Config.PriceRental            = 150      -- How much rental of a Motel Room apartment is - 0 = Free.
Config.Locale                 = 'sv'    -- Only defaultly supports English, feel free to add addtional language support.
Config.SwitchCharacterSup     = false    -- Optional Please ensure you have added xXFriendlysXx Switch Character fix aswell.
Config.LockRentedRooms	      = true	-- false = fler personer kan äga samma rum

Config.RoomMarker = {
    Owned = {r = 196, g = 42, b = 190},     -- Owned Motel Color
	x = 0.8, y = 0.8, z = 0.8  -- Standard Size Circle
}

Config.Zones = {

    PinkCage = {
        Name = "Pink Cage Motel",
        Pos = {x = 324.55, y = -212.44, z = 54.15, color = 23, sprite = 475, size = 1.0},
        roomExit = {x = 151.25, y = -1007.74, z = -99.00}, -- The Exit marker of the room, usually the only door hehe
        roomLoc = {x = 151.25, y = -1007.74, z = -99.00}, -- Where you will spawn IN the motel room
        BedStash = {x = 153.25, y = -1004.64, z = -99.0},  -- The Secret Stash Location of the Bed
        Inventory = {x = 151.83, y = -1001.32, z = -99.00},  -- The Inventory of the Room Main Storage
        Menu = {x = 151.05, y = -1003.26, z = -99.0}, -- Room Options Menu
        Boundries = 36.0, -- The Boundry Radius of the Motel (Will check ownerships etc.. if player is within this radius)
        Rooms = {
            Room1 = {
                number = 1,
                instancename = "pcm1",
                entry = {x = 312.83, y = -218.79, z = 54.22},
                    },

            Room2 = {
                number = 2,
                instancename = "pcm2",
                entry = {x = 310.9, y = -217.97, z = 54.22},
                    },

             Room3 = {
                number = 3,
                instancename = "pcm3",
                entry = {x = 307.24, y = -216.69, z = 54.22},
                    },

             Room4 = {
                number = 4,
                instancename = "pcm4",
                entry = {x = 307.58, y = -213.3, z = 54.22},
                     },

             Room5 = {
                number = 5,
                instancename = "pcm5",
                entry = {x = 309.51, y = -207.92, z = 54.22},
                    },

             Room5a = {
                number = "5a",
                instancename = "pcm5a",
                entry = {x = 311.27, y = -203.33, z = 54.22},
                    },

             Room6 = {
                number = 6,
                instancename = "pcm6",
                entry = {x = 313.36, y = -198.07, z = 54.22},
                    },

             Room7 = {
                number = 7,
                instancename = "pcm7",
                entry = {x = 315.77, y = -194.82, z = 54.22},
                    },

             Room8 = {
                number = 8,
                instancename = "pcm8",
                entry = {x = 319.4, y = -196.21, z = 54.22},
                    },

             Room9 = {
                number = 9,
                instancename = "pcm9",
                entry = {x = 321.44, y = -196.99, z = 54.22},
                    },

             Room11 = {
                number = 11,
                instancename = "pcm11",
                entry = {x = 312.83, y = -218.79, z = 58.02},
                    },

            Room12 = {
                number = 12,
                instancename = "pcm12",
                entry = {x = 310.9, y = -217.97, z = 58.02},
                    },

             Room13 = {
                number = 13,
                instancename = "pcm13",
                entry = {x = 307.24, y = -216.69, z = 58.02},
                    },

             Room14 = {
                number = 14,
                instancename = "pcm14",
                entry = {x = 307.58, y = -213.3, z = 58.02},
                    },

             Room15 = {
                number = 15,
                instancename = "pcm15",
                entry = {x = 309.51, y = -207.92, z = 58.02},
                    },

             Room16 = {
                number = 16,
                instancename = "pcm16",
                entry = {x = 311.27, y = -203.33, z = 58.02},
                    },

             Room17 = {
                number = 17,
                instancename = "pcm17",
                entry = {x = 313.36, y = -198.07, z = 58.02},
                    },

             Room18 = {
                number = 18,
                instancename = "pcm18",
                entry = {x = 315.77, y = -194.82, z = 58.02},
                    },

             Room19 = {
                number = 19,
                instancename = "pcm19",
                entry = {x = 319.4, y = -196.21, z = 58.02},
                    },

             Room20 = {
                number = 20,
                instancename = "pcm20",
                entry = {x = 321.44, y = -196.99, z = 58.02},
             },

             -- Left Side

             Room21 = {
                number = 21,
                instancename = "pcm21",
                entry = {x = 329.43, y = -225.02, z = 54.22},
             },
             Room22 = {
                number = 22,
                instancename = "pcm22",
                entry = {x = 331.44, y = -225.97, z = 54.22},
             },
             Room23 = {
                number = 23,
                instancename = "pcm23",
                entry = {x = 334.97, y = -227.36, z = 54.22},
             },
             Room24 = {
                number = 24,
                instancename = "pcm24",
                entry = {x = 337.09, y = -224.81, z = 54.22},
             },
             Room25 = {
                number = 25,
                instancename = "pcm25",
                entry = {x = 339.21, y = -219.45, z = 54.22},
             },
             Room26 = {
                number = 26,
                instancename = "pcm26",
                entry = {x = 340.8, y = -214.89, z = 54.22},
             },
             Room27 = {
                number = 27,
                instancename = "pcm27",
                entry = {x = 342.88, y = -209.6, z = 54.22},
             },
             Room28 = {
                number = 28,
                instancename = "pcm28",
                entry = {x = 344.59, y = -205.01, z = 54.22},
             },
             Room29 = {
                number = 29,
                instancename = "pcm29",
                entry = {x = 346.81, y = -199.73, z = 54.22},
             },

             --

             Room30 = {
                number = 30,
                instancename = "pcm30",
                entry = {x = 329.43, y = -225.02, z = 58.02},
             },
             Room31 = {
                number = 31,
                instancename = "pcm31",
                entry = {x = 331.44, y = -225.97, z = 58.02},
             },
             Room32 = {
                number = 32,
                instancename = "pcm32",
                entry = {x = 334.97, y = -227.36, z = 58.02},
             },
             Room33 = {
                number = 33,
                instancename = "pcm33",
                entry = {x = 337.09, y = -224.81, z = 58.02},
             },
             Room34 = {
                number = 34,
                instancename = "pcm34",
                entry = {x = 339.21, y = -219.45, z = 58.02},
             },
             Room35 = {
                number = 35,
                instancename = "pcm35",
                entry = {x = 340.8, y = -214.89, z = 58.02},
             },
             Room36 = {
                number = 36,
                instancename = "pcm36",
                entry = {x = 342.88, y = -209.6, z = 58.02},
             },
             Room37 = {
                number = 37,
                instancename = "pcm37",
                entry = {x = 344.59, y = -205.01, z = 58.02},
             },
             Room38 = {
                number = 38,
                instancename = "pcm38",
                entry = {x = 346.81, y = -199.73, z = 58.02},
             },

    }
},


MotorMotel = {
   Name = "The Motor Motel",
   Pos = {x = 1123.53, y = 2657.54, z = 37.0, color = 12, sprite = 475, size = 0.8},
   roomExit = {x = 151.25, y = -1007.74, z = -99.00}, -- The Exit marker of the room, usually the only door hehe
   roomLoc = {x = 151.25, y = -1007.74, z = -99.00}, -- Where you will spawn IN the motel room
   BedStash = {x = 153.25, y = -1004.64, z = -99.0},  -- The Secret Stash Location of the Bed
   Inventory = {x = 151.83, y = -1001.32, z = -99.00},  -- The Inventory of the Room Main Storage
   Menu = {x = 151.05, y = -1003.26, z = -99.0}, -- Room Options Menu
   Boundries = 36.0, -- The Boundry Radius of the Motel (Will check ownerships etc.. if player is within this radius)
   Rooms = {
       Room1 = {
           number = 1,
           instancename = "tmm1",
           entry = {x = 1142.32, y = 2654.7, z = 38.15},
         },
      Room2 = {
            number = 2,
            instancename = "tmm2",
            entry = {x = 1142.33, y = 2651.1, z = 38.15},
         },
      Room3 = {
            number = 3,
            instancename = "tmm3",
            entry = {x = 1142.42, y = 2643.59, z = 38.15},
         },
      Room4 = {
            number = 4,
            instancename = "tmm4",
            entry = {x = 1141.12, y = 2641.65, z = 38.15},
         },
      Room5 = {
            number = 5,
            instancename = "tmm5",
            entry = {x = 1136.32, y = 2641.64, z = 38.15},
         },
      Room6 = {
            number = 6,
            instancename = "tmm6",
            entry = {x = 1132.74, y = 2641.64, z = 38.15},
         },
      Room7 = {
            number = 7,
            instancename = "tmm7",
            entry = {x = 1125.22, y = 2641.65, z = 38.15},
         },
      Room8 = {
            number = 8,
            instancename = "tmm8",
            entry = {x = 1121.43, y = 2641.64, z = 38.15},
         },
      Room9 = {
            number = 9,
            instancename = "tmm9",
            entry = {x = 1114.76, y = 2641.67, z = 38.15},
         },
      Room10 = {
            number = 10,
            instancename = "tmm10",
            entry = {x = 1107.21, y = 2641.64, z = 38.15},
         },
      Room11 = {
            number = 11,
            instancename = "tmm11",
            entry = {x = 1106.01, y = 2649.09, z = 38.15},
         },
      Room12 = {
            number = 12,
            instancename = "tmm12",
            entry = {x = 1106.05, y = 2652.88, z = 38.15},
         }

      }
   },

   perreramotel = {
      Name = "Perrera Beach Motel",
      Pos = {x = -1471.81, y = -659.27, z = 28.17, color = 46, sprite = 475, size = 0.8},
      roomExit = {x = 151.25, y = -1007.74, z = -99.00}, -- The Exit marker of the room, usually the only door hehe
      roomLoc = {x = 151.25, y = -1007.74, z = -99.00}, -- Where you will spawn IN the motel room
      BedStash = {x = 153.25, y = -1004.64, z = -99.0},  -- The Secret Stash Location of the Bed
      Inventory = {x = 151.83, y = -1001.32, z = -99.00},  -- The Inventory of the Room Main Storage
      Menu = {x = 151.05, y = -1003.26, z = -99.0}, -- Room Options Menu
      Boundries = 36.0, -- The Boundry Radius of the Motel (Will check ownerships etc.. if player is within this radius)
      Rooms = {
          Room1 = {
              number = 1,
              instancename = "pbm1",
              entry = {x = -1493.67, y = -668.31, z = 29.03},
            },
         Room2 = {
              number = 2,
              instancename = "pbm2",
              entry = {x = -1498.16, y = -664.7, z = 29.03},
            },
         Room3 = {
              number = 3,
              instancename = "pbm3",
              entry = {x = -1495.35, y = -661.57, z = 29.03},
            },
         Room4 = {
              number = 4,
              instancename = "pbm4",
              entry = {x = -1490.7, y = -658.23, z = 29.03},
            },
         Room5 = {
              number = 5,
              instancename = "pbm5",
              entry = {x = -1486.77, y = -655.35, z = 29.58},
            },
         Room6 = {
              number = 6,
              instancename = "pbm6",
              entry = {x = -1482.18, y = -652.02, z = 29.58},
            },
         Room7 = {
              number = 7,
              instancename = "pbm7",
              entry = {x = -1478.18, y = -649.09, z = 29.58},
            },
         Room8 = {
              number = 8,
              instancename = "pbm8",
              entry = {x = -1473.6, y = -645.77, z = 29.58},
            },
         Room9 = {
              number = 9,
              instancename = "pbm9",
              entry = {x = -1469.64, y = -642.89, z = 29.58},
            },
         Room10 = {
              number = 10,
              instancename = "pbm10",
              entry = {x = -1465.14, y = -639.62, z = 29.58},
            },
         Room11 = {
              number = 11,
              instancename = "pbm11",
              entry = {x = -1461.21, y = -640.89, z = 29.58},
            },
         Room12 = {
              number = 12,
              instancename = "pbm12",
              entry = {x = -1452.34, y = -653.23, z = 29.58},
            },
         Room13 = {
              number = 13,
              instancename = "pbm13",
              entry = {x = -1454.35, y = -655.97, z = 29.58},
            },
         Room14 = {
              number = 14,
              instancename = "pbm14",
              entry = {x = -1458.96, y = -659.31, z = 29.58},
            },
         Room15 = {
              number = 15,
              instancename = "pbm15",
              entry = {x = -1462.92, y = -662.19, z = 29.58},
            },
         Room16 = {
              number = 16,
              instancename = "pbm16",
              entry = {x = -1467.53, y = -665.54, z = 29.58},
            },
         Room17 = {
              number = 17,
              instancename = "pbm17",
              entry = {x = -1471.48, y = -668.41, z = 29.58},
            },
         Room18 = {
              number = 18,
              instancename = "pbm18",
              entry = {x = -1461.22, y = -640.89, z = 33.38},
            },
         Room19 = {
              number = 19,
              instancename = "pbm19",
              entry = {x = -1457.87, y = -645.49, z = 33.38},
            },
         Room20 = {
              number = 20,
              instancename = "pbm20",
              entry = {x = -1455.62, y = -648.58, z = 33.38},
            },
         Room21 = {
              number = 21,
              instancename = "pbm21",
              entry = {x = -1452.33, y = -653.23, z = 33.38},
            },
         Room22 = {
              number = 22,
              instancename = "pbm22",
              entry = {x = -1454.4, y = -655.95, z = 33.38},
            },
         Room23 = {
              number = 23,
              instancename = "pbm23",
              entry = {x = -1459.02, y = -659.33, z = 33.38},
            },
         Room24 = {
              number = 24,
              instancename = "pbm24",
              entry = {x = -1462.95, y = -662.21, z = 33.38},
            },
         Room25 = {
              number = 25,
              instancename = "pbm25",
              entry = {x = -1467.58, y = -665.5, z = 33.38},
            },
         Room26 = {
              number = 26,
              instancename = "pbm26",
              entry = {x = -1471.49, y = -668.42, z = 33.38},
            },
         Room27 = {
              number = 27,
              instancename = "pbm27",
              entry = {x = -1476.1, y = -671.77, z = 33.38},
            },
         Room28 = {
              number = 28,
              instancename = "pbm28",
              entry = {x = -1464.98, y = -639.62, z = 33.38},
            },
         Room29 = {
              number = 29,
              instancename = "pbm29",
              entry = {x = -1469.61, y = -642.98, z = 33.38},
            },
         Room30 = {
              number = 30,
              instancename = "pbm30",
              entry = {x = -1473.60, y = -645.8, z = 33.38},
            },
         Room31 = {
              number = 31,
              instancename = "pbm31",
              entry = {x = -1478.15, y = -649.17, z = 33.38},
            },
         Room52 = {
              number = 52,
              instancename = "pbm52",
              entry = {x = -1482.13, y = -652.09, z = 33.38},
            },
         Room33 = {
              number = 33,
              instancename = "pbm33",
              entry = {x = -1486.73, y = -655.43, z = 33.38},
            },
         Room54 = {
              number = 54,
              instancename = "pbm54",
              entry = {x = -1490.75, y = -658.23, z = 33.38},
            },
         Room35 = {
              number = 35,
              instancename = "pbm35",
              entry = {x = -1495.33, y = -661.61, z = 33.38},
            },
         Room36 = {
              number = 36,
              instancename = "pbm36",
              entry = {x = -1498.13, y = -664.61, z = 33.38},
            },
         Room37 = {
              number = 37,
              instancename = "pbm37",
              entry = {x = -1493.69, y = -668.21, z = 33.38},
            },
         Room69 = {
              number = 69,
              instancename = "pbm69",
              entry = {x = -1489.94, y = -671.35, z = 33.38},
            },
   
      }
   },
   MotorMotel = {
      Name = "The Motor Motel",
      Pos = {x = 1123.53, y = 2657.54, z = 37.0, color = 12, sprite = 475, size = 0.8},
      roomExit = {x = 151.25, y = -1007.74, z = -99.00}, -- The Exit marker of the room, usually the only door hehe
      roomLoc = {x = 151.25, y = -1007.74, z = -99.00}, -- Where you will spawn IN the motel room
      BedStash = {x = 153.25, y = -1004.64, z = -99.0},  -- The Secret Stash Location of the Bed
      Inventory = {x = 151.83, y = -1001.32, z = -99.00},  -- The Inventory of the Room Main Storage
      Menu = {x = 151.05, y = -1003.26, z = -99.0}, -- Room Options Menu
      Boundries = 36.0, -- The Boundry Radius of the Motel (Will check ownerships etc.. if player is within this radius)
      Rooms = {
          Room1 = {
              number = 1,
              instancename = "tmm1",
              entry = {x = 1142.32, y = 2654.7, z = 38.15},
            },
         Room2 = {
               number = 2,
               instancename = "tmm2",
               entry = {x = 1142.33, y = 2651.1, z = 38.15},
            },
         Room3 = {
               number = 3,
               instancename = "tmm3",
               entry = {x = 1142.42, y = 2643.59, z = 38.15},
            },
         Room4 = {
               number = 4,
               instancename = "tmm4",
               entry = {x = 1141.12, y = 2641.65, z = 38.15},
            },
         Room5 = {
               number = 5,
               instancename = "tmm5",
               entry = {x = 1136.32, y = 2641.64, z = 38.15},
            },
         Room6 = {
               number = 6,
               instancename = "tmm6",
               entry = {x = 1132.74, y = 2641.64, z = 38.15},
            },
         Room7 = {
               number = 7,
               instancename = "tmm7",
               entry = {x = 1125.22, y = 2641.65, z = 38.15},
            },
         Room8 = {
               number = 8,
               instancename = "tmm8",
               entry = {x = 1121.43, y = 2641.64, z = 38.15},
            },
         Room9 = {
               number = 9,
               instancename = "tmm9",
               entry = {x = 1114.76, y = 2641.67, z = 38.15},
            },
         Room10 = {
               number = 10,
               instancename = "tmm10",
               entry = {x = 1107.21, y = 2641.64, z = 38.15},
            },
         Room11 = {
               number = 11,
               instancename = "tmm11",
               entry = {x = 1106.01, y = 2649.09, z = 38.15},
            },
         Room12 = {
               number = 12,
               instancename = "tmm12",
               entry = {x = 1106.05, y = 2652.88, z = 38.15},
            }
   
         }
      },
   BilingsgateMotel = {
   Name = "Bilingsgate Motel",
   Pos = {x = 566.69, y = -1763.1, z = 28.17, color = 1, sprite = 475, size = 0.8},
   roomExit = {x = 151.25, y = -1007.74, z = -99.00}, -- The Exit marker of the room, usually the only door hehe
   roomLoc = {x = 151.25, y = -1007.74, z = -99.00}, -- Where you will spawn IN the motel room
   BedStash = {x = 153.25, y = -1004.64, z = -99.0},  -- The Secret Stash Location of the Bed
   Inventory = {x = 151.83, y = -1001.32, z = -99.00},  -- The Inventory of the Room Main Storage
   Menu = {x = 151.05, y = -1003.26, z = -99.0}, -- Room Options Menu
   Boundries = 36.0, -- The Boundry Radius of the Motel (Will check ownerships etc.. if player is within this radius)
   Rooms = {
       Room1 = {
           number = 1,
           instancename = "bgm1",
           entry = {x = 566.19, y = -1778.16, z = 29.35},
         },
      Room2 = {
           number = 2,
           instancename = "bgm2",
           entry = {x = 550.43, y = -1775.6, z = 29.31},
         },
      Room3 = {
           number = 3,
           instancename = "bgm3",
           entry = {x = 552.28, y = -1771.51, z = 29.31},
         },
      Room4 = {
           number = 4,
           instancename = "bgm4",
           entry = {x = 554.68, y = -1766.26, z = 29.31},
         },
      Room5 = {
           number = 5,
           instancename = "bgm5",
           entry = {x = 557.8, y = -1759.63, z = 29.31},
         },
      Room6 = {
           number = 6,
           instancename = "bgm6",
           entry = {x = 561.37, y = -1751.81, z = 29.31},
         },
      Room7 = {
           number = 7,
           instancename = "bgm7",
           entry = {x = 560.18, y = -1776.97, z = 33.44},
         },
      Room8 = {
           number = 8,
           instancename = "bgm8",
           entry = {x = 559.11, y = -1777.34, z = 33.44},
         },
      Room10 = {
           number = 10,
           instancename = "bgm10",
           entry = {x = 550.11, y = -1770.52, z = 33.44},
         },
      Room11 = {
           number = 11,
           instancename = "bgm11",
           entry = {x = 552.53, y = -1765.31, z = 33.44},
         },
      Room12 = {
           number = 12,
           instancename = "bgm12",
           entry = {x = 555.62, y = -1758.68, z = 33.44},
         },
      Room14 = {
           number = 14,
           instancename = "bgm14",
           entry = {x = 559.26, y = -1750.79, z = 33.44},
         },
      Room15 = {
           number = 15,
           instancename = "bgm15",
           entry = {x = 561.78, y = -1747.3, z = 33.44},
         }

      }
   },

   DreamViewMotel = {
   Name = "Dream View Motel",
   Pos = {x = -117.95, y = 6337.31, z = 41.45, color = 24, sprite = 475, size = 0.8},
   roomExit = {x = 151.25, y = -1007.74, z = -99.00}, -- The Exit marker of the room, usually the only door hehe
   roomLoc = {x = 151.25, y = -1007.74, z = -99.00}, -- Where you will spawn IN the motel room
   BedStash = {x = 153.25, y = -1004.64, z = -99.0},  -- The Secret Stash Location of the Bed
   Inventory = {x = 151.83, y = -1001.32, z = -99.00},  -- The Inventory of the Room Main Storage
   Menu = {x = 151.05, y = -1003.26, z = -99.0}, -- Room Options Menu
   Boundries = 36.0, -- The Boundry Radius of the Motel (Will check ownerships etc.. if player is within this radius)
   Rooms = {
       Room1 = {
           number = 1,
           instancename = "dvm1",
           entry = {x = -111.15, y = 6322.9, z = 31.58},
         },
      Room2 = {
           number = 2,
           instancename = "dvm2",
           entry = {x = -114.33, y = 6326.08, z = 31.58},
         },
      Room3 = {
           number = 3,
           instancename = "dvm3",
           entry = {x = -120.18, y = 6327.23, z = 31.58},
         },
      Room4 = {
           number = 4,
           instancename = "dvm4",
           entry = {x = -111.11, y = 6322.84, z = 35.5},
         },
      Room5 = {
           number = 5,
           instancename = "dvm5",
           entry = {x = -114.3, y = 6326.04, z = 35.5},
         },
      Room6 = {
           number = 6,
           instancename = "dvm6",
           entry = {x = -120.29, y = 6327.21, z = 35.5},
         },
      Room7 = {
           number = 7,
           instancename = "dvm7",
           entry = {x = -103.47, y = 6330.71, z = 31.58},
         },
      Room8 = {
           number = 8,
           instancename = "dvm8",
           entry = {x = -106.63, y = 6333.96, z = 31.58},
         },
      Room9 = {
           number = 9,
           instancename = "dvm9",
           entry = {x = -107.63, y = 6339.79, z = 31.58},
         },
      Room10 = {
           number = 10,
           instancename = "dvm10",
           entry = {x = -102.15, y = 6345.25, z = 31.58},
         },
      Room11 = {
           number = 11,
           instancename = "dvm11",
           entry = {x = -98.92, y = 6348.53, z = 31.58},
         },
      Room12 = {
           number = 12,
           instancename = "dvm12",
           entry = {x = -93.49, y = 6353.98, z = 31.58},
         },
      Room13 = {
           number = 13,
           instancename = "dvm13",
           entry = {x = -90.28, y = 6357.21, z = 31.58},
         },
      Room14 = {
           number = 14,
           instancename = "dvm14",
           entry = {x = -84.51, y = 6362.27, z = 31.58},
         },
      Room15 = {
           number = 15,
           instancename = "dvm15",
           entry = {x = -103.51, y = 6330.74, z = 35.55},
         },
      Room16 = {
           number = 16,
           instancename = "dvm16",
           entry = {x = -106.7, y = 6333.93, z = 35.55},
         },
      Room17 = {
           number = 17,
           instancename = "dvm17",
           entry = {x = -107.63, y = 6339.78, z = 35.55},
         },
      Room18 = {
           number = 18,
           instancename = "dvm18",
           entry = {x = -102.12, y = 6345.24, z = 35.55},
         },
      Room19 = {
           number = 19,
           instancename = "dvm19",
           entry = {x = -98.86, y = 6348.42, z = 35.55},
         },
      Room20 = {
           number = 20,
           instancename = "dvm20",
           entry = {x = -93.51, y = 6353.98, z = 35.55},
         },
      Room21 = {
           number = 21,
           instancename = "dvm21",
           entry = {x = -90.28, y = 6357.2, z = 35.55},
         },
      Room22 = {
           number = 22,
           instancename = "dvm22",
           entry = {x = -84.78, y = 6362.63, z = 35.55},
         },
      }
   },
   EasternMotel = {
   Name = "Eastern Motel",
   Pos = {x = 367.57, y = 2625.58, z = 48.12, color = 7, sprite = 475, size = 0.8},
   roomExit = {x = 151.25, y = -1007.74, z = -99.00}, -- The Exit marker of the room, usually the only door hehe
   roomLoc = {x = 151.25, y = -1007.74, z = -99.00}, -- Where you will spawn IN the motel room
   BedStash = {x = 153.25, y = -1004.64, z = -99.0},  -- The Secret Stash Location of the Bed
   Inventory = {x = 151.83, y = -1001.32, z = -99.00},  -- The Inventory of the Room Main Storage
   Menu = {x = 151.05, y = -1003.26, z = -99.0}, -- Room Options Menu
   Boundries = 36.0, -- The Boundry Radius of the Motel (Will check ownerships etc.. if player is within this radius)
   Rooms = {
       Room1 = {
           number = 1,
           instancename = "em1",
           entry = {x = 341.69, y = 2614.92, z = 44.67},
         },
      Room2 = {
           number = 2,
           instancename = "em2",
           entry = {x = 347.02, y = 2618.11, z = 44.67},
         },
      Room3 = {
           number = 3,
           instancename = "em3",
           entry = {x = 354.4, y = 2619.68, z = 44.67},
         },
      Room4 = {
           number = 4,
           instancename = "em4",
           entry = {x = 359.78, y = 2622.78, z = 44.67},
         },
      Room5 = {
           number = 5,
           instancename = "em5",
           entry = {x = 367.15, y = 2624.46, z = 44.67},
         },
      Room6 = {
           number = 6,
           instancename = "em6",
           entry = {x = 372.48, y = 2627.65, z = 44.67},
         },
      Room7 = {
           number = 7,
           instancename = "em7",
           entry = {x = 379.86, y = 2629.22, z = 44.67},
         },
      Room8 = {
           number = 8,
           instancename = "em8",
           entry = {x = 385.21, y = 2632.42, z = 44.67},
         },
      Room9 = {
           number = 9,
           instancename = "em9",
           entry = {x = 392.62, y = 2634.0, z = 44.67},
         },
      Room10 = {
           number = 10,
           instancename = "em10",
           entry = {x = 397.95, y = 2637.1, z = 44.67},
         },
      }
   },
   TheTahitian = {
   Name = "The Tahitian",
   Pos = {x = -29.65, y = -1552.45, z = 31.59, color = 52, sprite = 475, size = 0.8},
   roomExit = {x = 151.25, y = -1007.74, z = -99.00}, -- The Exit marker of the room, usually the only door hehe
   roomLoc = {x = 151.25, y = -1007.74, z = -99.00}, -- Where you will spawn IN the motel room
   BedStash = {x = 153.25, y = -1004.64, z = -99.0},  -- The Secret Stash Location of the Bed
   Inventory = {x = 151.83, y = -1001.32, z = -99.00},  -- The Inventory of the Room Main Storage
   Menu = {x = 151.05, y = -1003.26, z = -99.0}, -- Room Options Menu
   Boundries = 36.0, -- The Boundry Radius of the Motel (Will check ownerships etc.. if player is within this radius)
   Rooms = {
       Room1 = {
           number = 1,
           instancename = "tt1",
           entry = {x = -35.59, y = -1554.98, z = 30.68},
         },
      Room2 = {
           number = 2,
           instancename = "tt2",
           entry = {x = -44.63, y = -1547.07, z = 31.45},
         },
      Room3 = {
           number = 3,
           instancename = "tt3",
           entry = {x = -36.1, y = -1536.91, z = 31.45},
         },
      Room4 = {
           number = 4,
           instancename = "tt4",
           entry = {x = -26.5, y = -1544.19, z = 30.68},
         },
      Room5 = {
           number = 5,
           instancename = "tt5",
           entry = {x = -19.61, y = -1550.83, z = 30.68},
         },
      Room6 = {
           number = 6,
           instancename = "tt6",
           entry = {x = -24.75, y = -1556.89, z = 30.69},
         },
      Room7 = {
           number = 7,
           instancename = "tt7",
           entry = {x = -33.54, y = -1567.2, z = 33.02},
         },
      Room8 = {
           number = 8,
           instancename = "tt8",
           entry = {x = -35.61, y = -1555.04, z = 33.82},
         },
      Room9 = {
           number = 9,
           instancename = "tt9",
           entry = {x = -44.41, y = -1547.19, z = 34.62},
         },
      Room10 = {
           number = 10,
           instancename = "tt10",
           entry = {x = -35.99, y = -1537.05, z = 34.62},
         },
      Room11 = {
           number = 11,
           instancename = "tt11",
           entry = {x = -26.67, y = -1544.43, z = 33.82},
         },
      Room12 = {
           number = 12,
           instancename = "tt12",
           entry = {x = -14.17, y = -1544.01, z = 33.02},
         },
      Room13 = {
           number = 13,
           instancename = "tt13",
           entry = {x = -19.84, y = -1550.62, z = 33.82},
         },
      }
   }
}

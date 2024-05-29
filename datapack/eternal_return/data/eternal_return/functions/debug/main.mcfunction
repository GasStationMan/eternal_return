
#> 디버그
#
#> eternal_return:debug/main
#>  eternal_return:debug/show_with_scoreboard
#>  eternal_return:debug/show_with_actionbar
#
function eternal_return:debug/show_with_scoreboard {Name:"this.root.id"  , Distance:5, Tag:"ER.animal.root"  , Show_Scoreboard:"df_id"       }
function eternal_return:debug/show_with_scoreboard {Name:"this.model.id" , Distance:5, Tag:"ER.animal.model" , Show_Scoreboard:"df_id"       }
function eternal_return:debug/show_with_scoreboard {Name:"this.hitbox.id", Distance:5, Tag:"ER.animal.hitbox", Show_Scoreboard:"df_id"       }
function eternal_return:debug/show_with_scoreboard {Name:"this.HPbar.id" , Distance:5, Tag:"ER.animal.HPbar" , Show_Scoreboard:"df_id"       }
function eternal_return:debug/show_with_scoreboard {Name:"this.hitbox.HP", Distance:5, Tag:"ER.animal.hitbox", Show_Scoreboard:"ER.health"   }
function eternal_return:debug/show_with_scoreboard {Name:"this.MaxHP"    , Distance:5, Tag:"ER.animal.root"  , Show_Scoreboard:"ER.health"   }
function eternal_return:debug/show_with_scoreboard {Name:"this.animtime" , Distance:5, Tag:"ER.animal.model" , Show_Scoreboard:"aj.anim_time"}

function eternal_return:debug/show_with_actionbar {Name:"ModelTag" , Distance:5, Tag:"ER.animal.model" , nbt:"Tags"}
#function eternal_return:debug/show_with_actionbar {Name:"ModelTag" , Distance:5, Tag:"ER.animal.root"  , nbt:"Tags"}
# float4.sqrt = (x_before + a_num/x_before)/2

set #float4.sqrt float 100000
op #x_before float = #float4.sqrt float 
op #x float = #a float
op #y float = #float4.sqrt float
function df_lib:float4/div_x_y/main
op #float4.sqrt float += #float4.div float
op #float4.sqrt float /= #2 float
if score #x_before float = #float4.sqrt float run return 1

op #x_before float = #float4.sqrt float 
op #x float = #a float
op #y float = #float4.sqrt float
function df_lib:float4/div_x_y/main
op #float4.sqrt float += #float4.div float
op #float4.sqrt float /= #2 float
if score #x_before float = #float4.sqrt float run return 1

op #x_before float = #float4.sqrt float 
op #x float = #a float
op #y float = #float4.sqrt float
function df_lib:float4/div_x_y/main
op #float4.sqrt float += #float4.div float
op #float4.sqrt float /= #2 float
if score #x_before float = #float4.sqrt float run return 1

op #x_before float = #float4.sqrt float 
op #x float = #a float
op #y float = #float4.sqrt float
function df_lib:float4/div_x_y/main
op #float4.sqrt float += #float4.div float
op #float4.sqrt float /= #2 float
if score #x_before float = #float4.sqrt float run return 1

op #x_before float = #float4.sqrt float 
op #x float = #a float
op #y float = #float4.sqrt float
function df_lib:float4/div_x_y/main
op #float4.sqrt float += #float4.div float
op #float4.sqrt float /= #2 float
if score #x_before float = #float4.sqrt float run return 1

op #x_before float = #float4.sqrt float 
op #x float = #a float
op #y float = #float4.sqrt float
function df_lib:float4/div_x_y/main
op #float4.sqrt float += #float4.div float
op #float4.sqrt float /= #2 float
if score #x_before float = #float4.sqrt float run return 1

op #x_before float = #float4.sqrt float 
op #x float = #a float
op #y float = #float4.sqrt float
function df_lib:float4/div_x_y/main
op #float4.sqrt float += #float4.div float
op #float4.sqrt float /= #2 float
if score #x_before float = #float4.sqrt float run return 1

op #x_before float = #float4.sqrt float 
op #x float = #a float
op #y float = #float4.sqrt float
function df_lib:float4/div_x_y/main
op #float4.sqrt float += #float4.div float
op #float4.sqrt float /= #2 float
if score #x_before float = #float4.sqrt float run return 1

op #x_before float = #float4.sqrt float 
op #x float = #a float
op #y float = #float4.sqrt float
function df_lib:float4/div_x_y/main
op #float4.sqrt float += #float4.div float
op #float4.sqrt float /= #2 float
if score #x_before float = #float4.sqrt float run return 1

reset #a float

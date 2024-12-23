# float4.sqrt = (x_before + a_num/x_before)/2

set #float4.sqrt float 20000

op #x_before float = #float4.sqrt float 
op #x float = #a float
op #x float /= #float4.sqrt float
op #float4.sqrt float += #x float
op #float4.sqrt float /= #2 float
if score #x_before float = #float4.sqrt float run return 1

op #x_before float = #float4.sqrt float 
op #x float = #a float
op #x float /= #float4.sqrt float
op #float4.sqrt float += #x float
op #float4.sqrt float /= #2 float
if score #x_before float = #float4.sqrt float run return 1

op #x_before float = #float4.sqrt float 
op #x float = #a float
op #x float /= #float4.sqrt float
op #float4.sqrt float += #x float
op #float4.sqrt float /= #2 float
if score #x_before float = #float4.sqrt float run return 1

op #x_before float = #float4.sqrt float 
op #x float = #a float
op #x float /= #float4.sqrt float
op #float4.sqrt float += #x float
op #float4.sqrt float /= #2 float
if score #x_before float = #float4.sqrt float run return 1

op #x_before float = #float4.sqrt float 
op #x float = #a float
op #x float /= #float4.sqrt float
op #float4.sqrt float += #x float
op #float4.sqrt float /= #2 float
if score #x_before float = #float4.sqrt float run return 1

op #x_before float = #float4.sqrt float 
op #x float = #a float
op #x float /= #float4.sqrt float
op #float4.sqrt float += #x float
op #float4.sqrt float /= #2 float
if score #x_before float = #float4.sqrt float run return 1

op #x_before float = #float4.sqrt float 
op #x float = #a float
op #x float /= #float4.sqrt float
op #float4.sqrt float += #x float
op #float4.sqrt float /= #2 float
if score #x_before float = #float4.sqrt float run return 1

op #x_before float = #float4.sqrt float 
op #x float = #a float
op #x float /= #float4.sqrt float
op #float4.sqrt float += #x float
op #float4.sqrt float /= #2 float
if score #x_before float = #float4.sqrt float run return 1

op #x_before float = #float4.sqrt float 
op #x float = #a float
op #x float /= #float4.sqrt float
op #float4.sqrt float += #x float
op #float4.sqrt float /= #2 float
if score #x_before float = #float4.sqrt float run return 1

reset #a float

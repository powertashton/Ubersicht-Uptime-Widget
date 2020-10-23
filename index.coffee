
# POSITION WIDGET ON SCREEN
pos_bottom		= '0px'
pos_right	= '120px'

# COLOUR SETTINGS
uptimeColor	= 'WHITE'
lineColor		= 'rgba(255,255,255,0.25)'
opacityLevel	= '0.6'
labelColor	= 'rgba(185,185,185,0.5)' 
nameColor	= 'rgba(#000, 0.0)'
bkground		=  'rgba(185,185,185,0.1)'
 

command: "uptime | awk '{ if ((/day/ && /hr/) || (/day/ && /min/) || (/day/ && /sec/)){ print $3, substr($4, 1, length($4)-1), $5, substr($6, 1, length($6)-1) } 
						  else if (/day/) { print $3, substr($4, 1, length($4)-1), substr($5, 1, length($5)-1) }
						  else if (/sec/ || /min/ || /hr/)  { print $3, substr($4, 1, length($4)-1) }
						  else { print substr($3, 1, length($3)-1) } }'"

# Update uptime every 60 secs
refreshFrequency: 60000

style: """
  bottom:	#{pos_bottom}
  right:	#{pos_right}
  font-family: Helvetica Neue
  color: #{uptimeColor}

  div
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 1), 0 6px 5px 0 rgba(0, 0, 0, 0.5)
    border-top: 1px solid #{lineColor}
    border-right: 1px solid #{lineColor}
    border-left: 1px solid #{lineColor}
    border-radius 5px 5px 0px 0px
    text-shadow: 0 0 1px #{bkground}
    background: #{bkground}
    font-size: 16px
    font-weight: 400
    opacity: #{opacityLevel}
    padding: 13px
    
    &:after
      content: 'UPTIME'
      position: absolute
      left: 0
      top: -14px
      font-size: 10px
      font-weight: 500
      color: #{labelColor}
   
  .uptime
    font-size: 16px
    font-weight: 500
    color: #{uptimeColor}
    margin: 1px
      
  img
    height: 18px
    width: 18px
    margin-bottom: -3px
    
    
"""

render: -> """
  <div><a class='uptime'></a></div>
"""

update: (output,domEl) ->
  values		= output.split("\n")
  uptime 		= values[0]
  div			= $(domEl)

  if (uptime != '')
    div.find('.uptime').html(uptime)

    
  		 
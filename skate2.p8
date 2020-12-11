pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
function _init()
	charh=24
	charw=1.4
	sw=127 --screen width
	sh=127 --screen height
	x=10 --player x
	y=0 --player y
	vx=0 --x velocity
	vy=0 --y velocity
	g=0.92--gravity
    counter=0
    sprn=016
    isFalling=false
    isJumping=false
    isGrounded=false
    jumpHeight=0
    pow = 0
    boosting=false
    top=20
end


function _update60()
    counter += 1

    if (counter % 12 == 0 and isGrounded) sprn = 018
    if (counter % 24 == 0 and isGrounded) sprn = 016
    if (isGrounded and boosting) sprn = 024
    if (isJumping) then
        jumpHeight += 1
        sprn = 020
    end


    if (btn(3) and pow < top and not isJumping) then
        boosting=true
        pow += .5
    end

    if (btn(0) and isGrounded and not isJumping and pow > 0) then
        isJumping=true
        boosting=false
        isGrounded=false
        vy += -2 * g
    end

    if (flr(vy) > 0) sprn = 022

    if (not isGrounded and not isJumping or jumpHeight >= pow) then
        vy += 0.2 * g
    end

    if (not btn(0) and not btn(3)) then
        boosting=false
        pow = 0
    end

	if (y > sh - 24) then
        isGrounded=true
        isJumping=false
        if(not boosting) then
            pow=0
            jumpHeight=0
        end
        vy = 0
        y = sh - 24
    end

	y += vy
end


function _draw()
	cls()
    if (boosting) then
        rectfill(0, 0, sw / top * pow, 2, 9)
    end
	rect(0, 0, sw, sh, 8)
	spr(sprn,x,y,1.5,3)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000440000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000444000000000000000000000000000000000000000000000000000000000000000000000000
00000444000000000000000000000000000000000000000000004444400000000000000000000000000000000000000000000000000000000000000000000000
000044444000000000000444000000000000044400000000000444ff440000000000000000000000000000000000000000000000000000000000000000000000
000444ff440000000000444440000000000044444000000000044ffff40000000000044400000000000000000000000000000000000000000000000000000000
0044fffff4000000000444ff44000000000444ff440000000004fffff40000000000444440000000000000000000000000000000000000000000000000000000
0004f0f0f40000000044fffff400000000044ffff40000000000ff0f00000000000444ff44000000000000000000000000000000000000000000000000000000
0000fffff00000000004f0f0f40000000044fffff4000000f000fffff00f00000044fffff4000000000000000000000000000000000000000000000000000000
0000fffff00000000000fffff00000000004ff0f000000000f022ff222ff00000004ff0f04000000000000000000000000000000000000000000000000000000
00222ff2220000000000fffff00000000000fffff000f0000ff222222ff000000000fffff0000000000000000000000000000000000000000000000000000000
00f222222f00000000222ff22200000000222ff222ff000000002222200000000000fffff0000000000000000000000000000000000000000000000000000000
00f022222f00000000f222222f0000000ff222222ff00000000022222000000000222ff222000000000000000000000000000000000000000000000000000000
00f022222f00000000f022222f0000000f00222220000000000022222000000000f222222f000000000000000000000000000000000000000000000000000000
00f022222000000000f022222f000000f000222220000000000011111000000000f0222220f00000000000000000000000000000000000000000000000000000
000011111000000000f02222200000000000222220000000000011111000000000f0222220f00000000000000000000000000000000000000000000000000000
0000111110000000000011111000000000001111100000000000111110000000000f222220000000000000000000000000000000000000000000000000000000
00001000100000000000100010000000000110001100000000011000110000000000111110000000000000000000000000000000000000000000000000000000
00001000100000000000100010000000000100000990000000999900010000000001100011000000000000000000000000000000000000000000000000000000
00001000100000000000100010000000000100099700000000070099999000000001000001000000000000000000000000000000000000000000000000000000
0000d000d00000000000d000d000000000019999000000000000000007000000000d00000d000000000000000000000000000000000000000000000000000000
00999999999900000099999999990000009990000000000000000000000000000099999999990000000000000000000000000000000000000000000000000000
00070000007000000007000000700000000700000000000000000000000000000007000000700000000000000000000000000000000000000000000000000000

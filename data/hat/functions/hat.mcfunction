#> hat:hat
# 手に持っているアイテムをかぶる
# @internal

## オフハンドとメインハンドをスワップ
summon armor_stand ~ ~ ~ {UUID: [I; 6, 7, 0, 7],Invisible:1b,Silent:1b,Invulnerable:1b,Marker:1b}
item replace entity 00000006-0000-0007-0000-000000000007 weapon.offhand from entity @s weapon.offhand
item replace entity @s weapon.offhand from entity @s weapon.mainhand
item replace entity @s weapon.mainhand from entity 00000006-0000-0007-0000-000000000007 weapon.offhand
#kill 00000006-0000-0007-0000-000000000007

## メッセージ 翻訳されたアイテム名を取得するためにエンティティを呼ぶ
summon item ~ 300 ~ {Item:{id:"minecraft:stone",Count:1b,tag:{display:{Name:'{"text":"!"}'}}},UUID:[I;0,0,0,1000]}
data modify entity 00000000-0000-0000-0000-0000000003e8 Item merge from entity @s SelectedItem

scoreboard players set _ _ 0
    ### 名前なしのアイテム
    execute if data entity 00000000-0000-0000-0000-0000000003e8 {Item:{tag:{display:{Name:'{"text":"!"}'}}}} run scoreboard players set _ _ 1
    ### メインハンドが空かどうか
    execute if data entity 00000000-0000-0000-0000-0000000003e8 {Item:{id:"minecraft:stone",tag:{display:{Name:'{"text":"!"}'}}}} run scoreboard players set _ _ -1

    ### アイテムのデフォルト名を表示
    execute if score _ _ matches 1 run tellraw @s [{"selector":"00000000-0000-0000-0000-0000000003e8","color":"green"},{"text":" をかぶりました。","color": "gray"}]
    ### アイテムの名前を表示
    execute if score _ _ matches 0 run tellraw @s [{"nbt": "SelectedItem.tag.display.Name", "entity": "@s", "interpret": true,"color":"green"},{"text":" をかぶりました。","color": "gray"}]
    ### 空手の時
    execute if score _ _ matches -1 run tellraw @s {"text":"アイテムを脱ぎました。","color": "gray"}

kill 00000000-0000-0000-0000-0000000003e8


# mainhand と 頭装備 を swap
#summon armor_stand 0.0 0 0.0 {Small:true,UUID:[I;0,0,0,1000],Marker:true}
#item replace entity 00000000-0000-0000-0000-0000000003e8 weapon.mainhand from entity @s weapon.mainhand
item replace entity @s weapon.mainhand from entity @s armor.head
item replace entity @s armor.head from entity 00000006-0000-0007-0000-000000000007 weapon.offhand
kill 00000006-0000-0007-0000-000000000007

# アイテムをひろう音を消して、装備の音を鳴らす
stopsound @a[distance=..10] * entity.item.pickup
playsound item.armor.equip_chain player @a ~ ~ ~ 1.0 1.0 0.0

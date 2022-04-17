#> hat:
# 手に持っているアイテムをかぶる
# @internal

# 真上向いているかどうか
execute anchored eyes positioned ~ ~5.0 ~ positioned ^ ^ ^-5.0 as @s[dx=0] run function hat:hat

# 進捗リセット
advancement revoke @s only hat:hat
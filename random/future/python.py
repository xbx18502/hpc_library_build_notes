def solve(S):
    n = len(S)
    max_flip = 0
    
    # 裏返せるコマの数を計算する
    def count_flips(board, pos, color):
        count = 0
        # oppsiteは相手のコマの色
        opposite = 'W' if color == 'B' else 'B'
        
        # 左側で裏返せるコマをチェックする
        temp_count = 0
        has_left_anchor = False
        for i in range(pos-1, -1, -1):
            if board[i] == '.':
                break
            if board[i] == opposite:
                temp_count += 1
            if board[i] == color:
                has_left_anchor = True
                count += temp_count
                break
            
        # 右側で裏返せるコマをチェックする
        temp_count = 0
        has_right_anchor = False
        for i in range(pos+1, n):
            if board[i] == '.':
                break
            if board[i] == opposite:
                temp_count += 1
            if board[i] == color:
                has_right_anchor = True
                count += temp_count
                break
        
        # 少なくとも片側にアンカーがあり、裏返せるコマがある場合、その数を返す
        if (has_left_anchor or has_right_anchor) and count > 0:
            return count
        return 0
    
    # すべての空きマスを探索する
    for i in range(n):
        if S[i] == '.':
            # 白コマを置いてみる
            flips_white = count_flips(S, i, 'W')
            max_flip = max(max_flip, flips_white)
            
            # 黒コマを置いてみる
            flips_black = count_flips(S, i, 'B')
            max_flip = max(max_flip, flips_black)
    
    return max_flip

# 入力を読み込んで結果を出力する
S = input().strip()
print(solve(S))
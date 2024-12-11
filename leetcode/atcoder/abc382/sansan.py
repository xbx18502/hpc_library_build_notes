#!/usr/bin python3
def main(lines):
    # アルファベットの出現回数をカウントする配列を初期化（a-zの26文字分）
    count = [0] * 26
    
    # 4行目の文字列を空白で分割し、各文字の出現回数をカウント
    # ord(char) - 97で'a'を0、'b'を1...という風にインデックスに変換
    for char in lines[3].split():
        count[ord(char) - 97] += 1
    
    # 2行目の文字列を空白で分割してソート
    chars = lines[1].split()
    chars.sort()
    
    # prevはポインタとして前の文字を指す，重複を除いて出力
    prev = None
    for char in chars:
        if char != prev:  # 前の文字と異なる場合のみ出力
            print(f"{char}:{count[ord(char) - 97]}")
            prev = char

if __name__ == '__main__':
    # 入力を4行読み込む
    lines = []
    for _ in range(4):
        line = input().rstrip('\r\n')
        lines.append(line)
    main(lines)
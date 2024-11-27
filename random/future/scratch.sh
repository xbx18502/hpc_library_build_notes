// 黑白棋的题
package track;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class App {

    public static void main(String[] args) throws IOException {
        String[] lines = getStdin();
        String S = lines[0];
        int n = S.length();
        int maxFlip = 0;

        char[] board = S.toCharArray(); // 将字符串转换为字符数组，避免重复调用 charAt()

        // 遍历每个位置，计算最大翻转数
        for (int i = 0; i < n; i++) {
            if (board[i] == '.') {
                int flips = countFlips(board, i, 'B');
                if (flips > maxFlip) maxFlip = flips;
                flips = countFlips(board, i, 'W');
                if (flips > maxFlip) maxFlip = flips;
            }
        }

        System.out.println(maxFlip);
    }

    // 计算在指定位置放置指定颜色时可以翻转的棋子数
    private static int countFlips(char[] board, int pos, char color) {
        int count = 0;
        char opposite = (color == 'B') ? 'W' : 'B';
        int n = board.length;

        // 向左检查可以翻转的棋子
        int tempCount = 0;
        int i = pos - 1;
        while (i >= 0 && board[i] == opposite) {
            tempCount++;
            i--;
        }
        if (i >= 0 && board[i] == color) {
            count += tempCount;
        }

        // 向右检查可以翻转的棋子
        tempCount = 0;
        i = pos + 1;
        while (i < n && board[i] == opposite) {
            tempCount++;
            i++;
        }
        if (i < n && board[i] == color) {
            count += tempCount;
        }

        return count;
    }

    // 优化后的输入函数，只读取一行输入
    private static String[] getStdin() throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String line = br.readLine();
        return new String[]{line};
    }
}

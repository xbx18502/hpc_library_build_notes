import java.util.*;

public class Main {
    static int H, W, D;
    static char[][] office;
    static List<int[]> humidifiers = new ArrayList<>();
    static int[] dx = { 0, 0, 1, -1 }; // right, left, down, up
    static int[] dy = { 1, -1, 0, 0 };

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        H = sc.nextInt();
        W = sc.nextInt();
        D = sc.nextInt();
        sc.nextLine(); // consume newline

        office = new char[H][W];

        // Read office layout
        for (int i = 0; i < H; i++) {
            String row = sc.nextLine();
            for (int j = 0; j < W; j++) {
                office[i][j] = row.charAt(j);
                if (office[i][j] == 'H') {
                    humidifiers.add(new int[] { i, j });
                }
            }
        }

        boolean[][] covered = new boolean[H][W];
        int totalCovered = 0;

        // Process each humidifier
        for (int[] humidifier : humidifiers) {
            totalCovered += bfs(humidifier[0], humidifier[1], covered);
        }

        System.out.println(totalCovered);
        sc.close();
    }

    static int bfs(int startX, int startY, boolean[][] covered) {
        Queue<int[]> queue = new LinkedList<>();
        boolean[][] visited = new boolean[H][W];
        int count = 0;
        
        queue.offer(new int[]{startX, startY, 0});
        visited[startX][startY] = true;
        
        while (!queue.isEmpty()) {
            int[] current = queue.poll();
            int x = current[0];
            int y = current[1];
            int currentSteps = current[2];
            
            // Count both floor and humidifier cells if not already covered
            if ((office[x][y] == '.' || office[x][y] == 'H') && !covered[x][y]) {
                covered[x][y] = true;
                count++;
            }
            
            if (currentSteps >= D) continue;
            
            for (int i = 0; i < 4; i++) {
                int nx = x + dx[i];
                int ny = y + dy[i];
                
                if (isValid(nx, ny) && !visited[nx][ny] && office[nx][ny] != '#') {
                    queue.offer(new int[]{nx, ny, currentSteps + 1});
                    visited[nx][ny] = true;
                }
            }
        }
        
        return count;
    }

    static boolean isValid(int x, int y) {
        return x >= 0 && x < H && y >= 0 && y < W;
    }
}
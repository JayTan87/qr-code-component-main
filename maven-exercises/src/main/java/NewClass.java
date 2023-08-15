import org.apache.commons.lang3.StringUtils;

import javax.print.DocFlavor;
import java.util.Scanner;

public class NewClass {

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter something:");
        String userInput = scan.nextLine();

        System.out.println(userInput);
        System.out.println(StringUtils.swapCase(userInput));
        System.out.println(StringUtils.reverse(userInput));

    }

}

package mei.xin.gallery.common;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

    public static String getNowDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now = new Date();
        return sdf.format(now);
    }

    public static Timestamp getNowDateInSql() {
        Date date = new Date();
        Timestamp timeStamp = new Timestamp(date.getTime());
        return timeStamp;
    }

    public static String getNowDateInFile() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_hh_ss_mm");
        Date now = new Date();
        return sdf.format(now);
    }
}

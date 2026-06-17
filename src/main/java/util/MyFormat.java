package util;

import java.text.DecimalFormat;

public class MyFormat {
	// 金額データを「\付き、3桁カンマ区切り」の形式に変換する
	public String moneyFormat(int price) {
		DecimalFormat df = new DecimalFormat("\u00A5###,##0");
		return df.format(price);
	}
}

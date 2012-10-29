using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HutStaff.Common
{
    public class Utility
    {
        public class ExcelHelper
        {
            public static long ColumnNameToIndex(string columnName)
            {
                char[] chars = columnName.ToUpper().ToCharArray();

                return (long)(Math.Pow(26, chars.Count() - 1)) *
                    (System.Convert.ToInt32(chars[0]) - 64) +
                    ((chars.Count() > 2) ? ColumnNameToIndex(columnName.Substring(1, columnName.Length - 1)) :
                    ((chars.Count() == 2) ? (System.Convert.ToInt32(chars[chars.Count() - 1]) - 64) : 0));
            }

            public static string IndexToColumnName(int index)
            {
                StringBuilder retVal = new StringBuilder();
                int x = 0;
                for (int n = (int)(Math.Log(25 * (index + 1)) / Math.Log(26)) - 1; n >= 0; n--)
                {
                    x = (int)((Math.Pow(26, (n + 1)) - 1) / 25 - 1);
                    if (index > x)
                        retVal.Append(System.Convert.ToChar((int)(((index - x - 1) / Math.Pow(26, n)) % 26 + 65)));
                }
                return retVal.ToString();

            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.Common;

namespace HutStaff.Administrator.Controls.Common
{
    public partial class Pager : ControlBase
    {
        public int CurrentPage { get; set; }
        public int TotalPage { get; set; }
        public int PageSize { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string GenPaging()
        {
            string html = "";
            if (CurrentPage < 4)
            {
                if (TotalPage > CurrentPage)
                {
                    int range = TotalPage - CurrentPage;
                    if (range > 2) range = 2;
                    for (int i = 1; i <= CurrentPage + range; i++)
                    {
                        if (i == CurrentPage)
                            html += "<span class='paging_button active'><a href='javascript:void(0);' title='Current page' index='" + i + "'>" + i + "</a></span>";
                        else
                            html += "<span class='paging_button'><a href='javascript:void(0);' title='Page " + i + "' index='" + i + "'>" + i + "</a></span>";
                    }
                    if (TotalPage > 3)
                    {
                        html += "<span class='paging_dot'>...</span>";
                    }
                }
                else
                {
                    for (int i = 1; i <= CurrentPage; i++)
                    {
                        if (i == CurrentPage)
                            html += "<span class='paging_button active'><a href='javascript:void(0);' title='Currnet page'  index='" + i + "'>" + i + "</a></span>";
                        else
                            html += "<span class='paging_button'><a href='javascript:void(0);' title='Page " + i + "' index='" + i + "'>" + i + "</a></span>";
                    }
                }
            }
            else if (CurrentPage > TotalPage - 3)
            {
                html += "<span class='paging_dot'>...</span>";
                for (int i = TotalPage - 4; i <= TotalPage; i++)
                {
                    if (i != 0)
                    {
                        if (i == CurrentPage)
                            html += "<span class='paging_button active'><a href='javascript:void(0);' title='Currnet page' index='" + i + "'>" + i + "</a></span>";
                        else
                            html += "<span class='paging_button'><a href='javascript:void(0);' title='Page " + i + "' index='" + i + "'>" + i + "</a></span>";
                    }
                }
            }
            else
            {
                html += "<span class='paging_dot'>...</span>";
                for (int i = CurrentPage - 2; i <= CurrentPage + 2; i++)
                {
                    if (i != 0)
                    {
                        if (i == CurrentPage)
                            html += "<span class='paging_button active'><a href='javascript:void(0);' title='Currnet page'  index='" + i + "'>" + i + "</a></span>";
                        else
                            html += "<span class='paging_button'><a href='javascript:void(0);' title='Page " + i + "'' index='" + i + "'>" + i + "</a></span>";
                    }
                }
                html += "<span class='paging_dot'>...</span>";
            }
            return html;
        }

    }
}
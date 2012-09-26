using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HutStaff.Administrator.Controls.Common
{
    public partial class Pager : System.Web.UI.UserControl
    {
        protected int totalItems;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //Binding data to control
                lblInfo.Text = string.Format(" {0} đến {1} của {2} ", ((PageIndex - 1) * PageSize + 1), (PageSize * PageIndex < TotalItem) ? PageSize * PageIndex : TotalItem, TotalItem);
                txtPageIndex.Text = PageIndex.ToString();
                ddlPageSize.SelectedValue = PageSize.ToString();

                //Fire event to control
                txtPageIndex.Attributes.Add("onchange", string.Format("changePageIndex('#{0}tblPager', {1})", UID, TotalItem));
                ddlPageSize.Attributes.Add("onchange", string.Format("changePageSize('#{0}tblPager')", UID));
                lnkNextPage.Attributes.Add("onclick", string.Format("nextPage('#{0}tblPager', {1})", UID, TotalItem));
                lnkPrePage.Attributes.Add("onclick", string.Format("prePage('#{0}tblPager')", UID));
            }
        }

        public int TotalItem
        {
            get { return totalItems; }
            set { totalItems = value; }
        }

        private string m_HtmlId;
        public string HtmlId
        {
            set { m_HtmlId = value; }
            get { return m_HtmlId; }
        }

        private string m_UID;
        public string UID
        {
            get { return m_UID; }
            set { m_UID = value; }
        }

        private int m_PageIndex;
        public int PageIndex
        {
            get { return m_PageIndex; }
            set { m_PageIndex = value; }
        }
        private int m_PageSize;
        public int PageSize
        {
            get { return m_PageSize; }
            set { m_PageSize = value; }
        }

        private string m_Params;
        public string ControlParams
        {
            get { return HttpUtility.UrlEncode(m_Params); }
            set { m_Params = value; }
        }
    }
}
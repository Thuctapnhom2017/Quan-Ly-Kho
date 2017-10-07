using InventoryManage.Models.Entity;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace InventoryManage
{
    
    public partial class FormLogIn : Form
    {
        
        public FormLogIn()
        {
            InitializeComponent();
        }
        MyContext db = new MyContext();
        private void BtLog_Click(object sender, EventArgs e)
        {
            if(TxtLogName.Text == "" || TxtLogPass.Text == "")
            {
                MessageBox.Show("Enter UserName and Password");
                return;
            }
            else
            {
                var result = db.Users.Where(p => p.UserName == TxtLogName.Text && p.Pass == TxtLogPass.Text).SingleOrDefault();
                if(result == null)
                {
                    MessageBox.Show("Your Account doesn't exist");
                    TxtLogName.Clear();
                    TxtLogPass.Clear();
                }
                else
                {
                    this.Hide();
                    MessageBox.Show("Log in successfully");
                    Medium.IdSto = result.ID;
                    Medium.Active = true;
                    FormHome f = new FormHome();
                    f.Show();
                }
            }
        }
    }
}

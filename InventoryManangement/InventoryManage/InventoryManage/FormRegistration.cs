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
    public partial class FormRegistration : Form
    {
        MyContext db = new MyContext();
        public FormRegistration()
        {
            InitializeComponent();
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void BtnRes_Click(object sender, EventArgs e)
        {
            if(TxtResName.Text == null || TxtResUser.Text == null || TxtResPass1.Text == null || TxtResPass2.Text == null)
            {
                MessageBox.Show("Fill in information");
            }
            else
            {
                int ID = Convert.ToInt32(TxtResName.Text);
                var result = db.Storekeepers.Where(p => p.ID == ID).SingleOrDefault();
                if (result == null)
                {
                    MessageBox.Show("Yours Id doesn't exist");
                    TxtResName.Clear();
                }
                else
                {
                    var result1 = db.Users.Where(p => p.UserName == TxtResUser.Text).SingleOrDefault();
                    if ( result1 != null )
                    {
                        MessageBox.Show("UserName existed, Enter difference Username");
                        TxtResUser.Clear();
                        
                    }
                    else
                    {
                        if(TxtResPass1.Text != TxtResPass2.Text)
                        {
                            MessageBox.Show("Password isn't correct");
                            TxtResPass2.Clear();
                            
                        }
                        else
                        {
                            User user = new User();
                            user.UserName = TxtResUser.Text;
                            user.Pass = TxtResPass1.Text;
                            user.ID = Convert.ToInt32(TxtResName.Text);
                            db.Users.Add(user);
                            db.SaveChanges();
                            this.Hide();
                            MessageBox.Show("Registration successfully");
                            FormHome f = new FormHome();
                            f.Show();
                        }
                    }
                }
            }
            
        }

        private void TxtResId_TextChanged(object sender, EventArgs e)
        {

        }

        private void TxtResName_TextChanged(object sender, EventArgs e)
        {
            if(TxtResName.Text != "")
            {
                int ID = Convert.ToInt32(TxtResName.Text);
                var result = db.Storekeepers.Where(p => p.ID == ID).SingleOrDefault();
                if (result != null)
                {
                    TxtResEmail.Text = result.Email;
                    TxtResId.Text = result.Name;
                }
                else
                {
                    TxtResEmail.Clear();
                    TxtResId.Clear();
                }

            }
            
        }
    }
}

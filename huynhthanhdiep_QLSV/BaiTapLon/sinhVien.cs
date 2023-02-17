using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BaiTapLon
{
    public partial class sinhVien : Form
    {                              
        quanLy ql = new quanLy();

        public sinhVien()
        {
            InitializeComponent();
        }

        private void sinhVien_Load(object sender, EventArgs e)
        {
            enabledTextBox(false);
            enabledButton(true, false, false, false, true);
            loadData();
            loadDataMakhoa();
        }

        private void loadData()
        {
            dataGridView1.DataSource = ql.getData("select * from vw_hienAllSinhVien");
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            enabledTextBox(true);
            enabledButton(false, false, false, true, true);
            txtMasv.Focus();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                if (check_Empty() && check_Ma_Sua() && check_Tuoi())
                {                                        
                    using (SqlCommand Cmd = new SqlCommand("suaSV", ql.Cnn))
                    {
                        ql.openConnect();
                        Cmd.CommandType = CommandType.StoredProcedure;
                        Cmd.Parameters.AddWithValue("@sMaSV", dataGridView1.CurrentRow.Cells[0].Value.ToString());
                        Cmd.Parameters.AddWithValue("@sHoten", txtHoten.Text);
                        Cmd.Parameters.AddWithValue("@dNgaysinh", DateTime.Parse(dtNgaysinh.Value.ToString()));
                        Cmd.Parameters.AddWithValue("@sGioitinh", cbGioitinh.Text);
                        Cmd.Parameters.AddWithValue("@sMakhoa", cbMakhoa.SelectedValue.ToString());
                        Cmd.Parameters.AddWithValue("@sQuequan", txtQuequan.Text);
                        int ret = Cmd.ExecuteNonQuery();
                        if (ret > 0)
                        {
                            loadData();
                            MessageBox.Show("Sửa thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
                        }
                        else
                        {
                            MessageBox.Show("Sửa thất bại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                        ql.closeConnect();
                    }
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Sửa thất bại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtMasv.Text))
            {
                ql.deleteData("tblSinhVien","sMaSV", "@sMaSV", txtMasv.Text);
                loadData();
                enabledButton(true, false, false, false, true);
                enabledTextBox(false);
            }
            else
            {
                MessageBox.Show("Chọn mã sinh viên cần xóa", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                enabledTextBox(true);
            }
            resetNull(); 
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            try
            {
                if (check_Empty() && check_Ma() && check_Tuoi())
                {                                          
                    using (SqlCommand Cmd = new SqlCommand("themSinhVien", ql.Cnn))
                    {
                        ql.openConnect();
                        Cmd.CommandType = CommandType.StoredProcedure;
                        Cmd.Parameters.AddWithValue("@sMasv", txtMasv.Text);
                        Cmd.Parameters.AddWithValue("@sHoten", txtHoten.Text);
                        Cmd.Parameters.AddWithValue("@sMakhoa", cbMakhoa.SelectedValue.ToString().Trim());
                        Cmd.Parameters.AddWithValue("@dNgaysinh", DateTime.Parse(dtNgaysinh.Value.ToString()));
                        Cmd.Parameters.AddWithValue("@sGioitinh", cbGioitinh.Text);
                        Cmd.Parameters.AddWithValue("@sQuequan", txtQuequan.Text);
                        int i = Cmd.ExecuteNonQuery();
                        if (i > 0)
                        {
                            loadData();
                            MessageBox.Show("Thêm thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
                        }
                        else
                        {
                            MessageBox.Show("Thêm thất bại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                        ql.closeConnect();
                    }
                    resetNull();
                    enabledTextBox(false);
                    enabledButton(true, false, false, false, true);
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Thêm thất bại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            resetNull();
            enabledTextBox(false);
            enabledButton(true, false, false, false, true);
            loadData();
        }

        private void loadDataMakhoa()
        {    
            //ql.getDataComBoBox("tblKhoa", "sMakhoa", "sTenkhoa", cbMakhoa);
            string sqlData = "select sMakhoa, sTenkhoa from tblKhoa";
            DataTable dt = ql.getData(sqlData);
            DataView dv = new DataView(dt);
            dv.Sort = "sTenkhoa";
            cbMakhoa.DataSource = dv;
            cbMakhoa.DisplayMember = "sTenkhoa";
            cbMakhoa.ValueMember = "sMakhoa";
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex + 1 < dataGridView1.Rows.Count )
            {
                enabledButton(true, true, true, false, true);
                enabledTextBox(true);
                txtMasv.Enabled = false;
                cbGioitinh.Text = dataGridView1.CurrentRow.Cells[4].Value.ToString();    
                txtMasv.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
                txtHoten.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
                cbMakhoa.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
                dtNgaysinh.Value = DateTime.Parse(dataGridView1.CurrentRow.Cells[3].Value.ToString());
                txtQuequan.Text = dataGridView1.CurrentRow.Cells[5].Value.ToString();
            }else
            {
                resetNull();
            }
        }

        private void resetNull()
        {
            txtMasv.Text = "";
            txtHoten.Text = "";
            cbMakhoa.Text = null;
            txtQuequan.Text = "";
            cbGioitinh.Text = null;       
        }

        private void enabledTextBox(bool mo)
        {
            txtMasv.Enabled = mo;
            txtHoten.Enabled = mo;
            cbMakhoa.Enabled = mo;
            dtNgaysinh.Enabled = mo;
            cbGioitinh.Enabled = mo;
            txtQuequan.Enabled = mo;
        }

        private void enabledTextBox(bool masv, bool hoten, bool makhoa, bool ngaysinh, bool gioitinh, bool quequan)
        {
            txtMasv.Enabled = masv;
            txtHoten.Enabled = hoten;
            cbMakhoa.Enabled =makhoa;
            dtNgaysinh.Enabled = ngaysinh;
            cbGioitinh.Enabled = gioitinh;
            txtQuequan.Enabled = quequan;
        }

        private void enabledButton(bool them, bool sua, bool xoa, bool luu, bool thoat)
        {
            btnThem.Enabled = them;
            btnSua.Enabled = sua;
            btnXoa.Enabled = xoa;
            btnLuu.Enabled = luu;
            btnThoat.Enabled = thoat;
        }

        private bool check_Empty()
        {
            if (string.IsNullOrEmpty(txtMasv.Text))
            {
                MessageBox.Show("Bạn chưa nhập mã sinh viên", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtMasv.Focus();
                return false;
            }
            if (string.IsNullOrEmpty(txtHoten.Text))
            {
                MessageBox.Show("Bạn chưa nhập tên sinh viên", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtHoten.Focus();
                return false;
            }
            if (string.IsNullOrEmpty(cbGioitinh.Text))
            {
                MessageBox.Show("Bạn chưa chọn giới tính sinh viên", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return false;
            }
            if (string.IsNullOrEmpty(cbMakhoa.Text))
            {
                MessageBox.Show("Bạn chưa nhập mã khoa", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                cbMakhoa.Focus();
                return false;
            }
            if (string.IsNullOrEmpty(txtQuequan.Text))
            {
                MessageBox.Show("Bạn chưa nhập quê quán", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtQuequan.Focus();
                return false;
            }
            return true;
        }

        private bool check_Ma()
        {
            try
            {                                                                                              
                return ql.check_Key("tblsinhvien","sMaSV",txtMasv.Text.Trim(), "Đã tồn tại mã sinh viên này");
            }
            catch (Exception)
            {
                return false;
            }
        }

        private bool check_Ma_Sua()
        {
            try
            {
                if (txtMasv.Text.Trim() != dataGridView1.CurrentRow.Cells[0].Value.ToString())
                {
                    MessageBox.Show("Không được sửa mã sinh viên", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        private bool check_Tuoi()
        {
            if (DateTime.Now.Year - dtNgaysinh.Value.Year < 18)
            {
                MessageBox.Show("Phải từ 18 tuổi trở lên","Thông báo");
                return false;
            }
            return true;
        }
    }
}

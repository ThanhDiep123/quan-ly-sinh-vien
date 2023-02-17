namespace BaiTapLon
{
    partial class timKiem
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.lbTitle = new System.Windows.Forms.Label();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.rdHienAll = new System.Windows.Forms.RadioButton();
            this.btnTimkiem = new System.Windows.Forms.Button();
            this.txtTheoMa = new System.Windows.Forms.TextBox();
            this.txtTheoTen = new System.Windows.Forms.TextBox();
            this.ckMa = new System.Windows.Forms.CheckBox();
            this.ckTen = new System.Windows.Forms.CheckBox();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(100, 215);
            this.dataGridView1.Margin = new System.Windows.Forms.Padding(4);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.Size = new System.Drawing.Size(598, 169);
            this.dataGridView1.TabIndex = 1;
            // 
            // lbTitle
            // 
            this.lbTitle.AutoSize = true;
            this.lbTitle.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbTitle.Location = new System.Drawing.Point(94, 9);
            this.lbTitle.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lbTitle.Name = "lbTitle";
            this.lbTitle.Size = new System.Drawing.Size(140, 31);
            this.lbTitle.TabIndex = 33;
            this.lbTitle.Text = "Tìm kiếm:";
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Items.AddRange(new object[] {
            "Sinh Viên",
            "Khoa",
            "Giảng Viên",
            "Đề Tài",
            "Phân công"});
            this.comboBox1.Location = new System.Drawing.Point(242, 18);
            this.comboBox1.Margin = new System.Windows.Forms.Padding(4);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(297, 24);
            this.comboBox1.TabIndex = 34;
            this.comboBox1.TextChanged += new System.EventHandler(this.comboBox1_TextChanged);
            // 
            // rdHienAll
            // 
            this.rdHienAll.AutoSize = true;
            this.rdHienAll.Location = new System.Drawing.Point(242, 68);
            this.rdHienAll.Margin = new System.Windows.Forms.Padding(4);
            this.rdHienAll.Name = "rdHienAll";
            this.rdHienAll.Size = new System.Drawing.Size(156, 20);
            this.rdHienAll.TabIndex = 35;
            this.rdHienAll.TabStop = true;
            this.rdHienAll.Text = "Hiện tất cả danh sách";
            this.rdHienAll.UseVisualStyleBackColor = true;
            this.rdHienAll.CheckedChanged += new System.EventHandler(this.rdHienAll_CheckedChanged);
            // 
            // btnTimkiem
            // 
            this.btnTimkiem.Location = new System.Drawing.Point(571, 18);
            this.btnTimkiem.Margin = new System.Windows.Forms.Padding(4);
            this.btnTimkiem.Name = "btnTimkiem";
            this.btnTimkiem.Size = new System.Drawing.Size(127, 30);
            this.btnTimkiem.TabIndex = 38;
            this.btnTimkiem.Text = "Tìm kiếm";
            this.btnTimkiem.UseVisualStyleBackColor = true;
            this.btnTimkiem.Click += new System.EventHandler(this.btnTimkiem_Click);
            // 
            // txtTheoMa
            // 
            this.txtTheoMa.Location = new System.Drawing.Point(461, 107);
            this.txtTheoMa.Margin = new System.Windows.Forms.Padding(4);
            this.txtTheoMa.Name = "txtTheoMa";
            this.txtTheoMa.Size = new System.Drawing.Size(165, 22);
            this.txtTheoMa.TabIndex = 39;
            // 
            // txtTheoTen
            // 
            this.txtTheoTen.Location = new System.Drawing.Point(461, 147);
            this.txtTheoTen.Margin = new System.Windows.Forms.Padding(4);
            this.txtTheoTen.Name = "txtTheoTen";
            this.txtTheoTen.Size = new System.Drawing.Size(165, 22);
            this.txtTheoTen.TabIndex = 39;
            // 
            // ckMa
            // 
            this.ckMa.AutoSize = true;
            this.ckMa.Location = new System.Drawing.Point(242, 109);
            this.ckMa.Margin = new System.Windows.Forms.Padding(4);
            this.ckMa.Name = "ckMa";
            this.ckMa.Size = new System.Drawing.Size(103, 20);
            this.ckMa.TabIndex = 40;
            this.ckMa.Text = "Tìm theo mã";
            this.ckMa.UseVisualStyleBackColor = true;
            this.ckMa.CheckedChanged += new System.EventHandler(this.ckMa_CheckedChanged);
            // 
            // ckTen
            // 
            this.ckTen.AutoSize = true;
            this.ckTen.Location = new System.Drawing.Point(242, 149);
            this.ckTen.Margin = new System.Windows.Forms.Padding(4);
            this.ckTen.Name = "ckTen";
            this.ckTen.Size = new System.Drawing.Size(102, 20);
            this.ckTen.TabIndex = 40;
            this.ckTen.Text = "Tìm theo tên";
            this.ckTen.UseVisualStyleBackColor = true;
            this.ckTen.CheckedChanged += new System.EventHandler(this.ckTen_CheckedChanged);
            // 
            // timKiem
            // 
            this.AcceptButton = this.btnTimkiem;
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.DodgerBlue;
            this.ClientSize = new System.Drawing.Size(742, 397);
            this.Controls.Add(this.ckTen);
            this.Controls.Add(this.ckMa);
            this.Controls.Add(this.txtTheoTen);
            this.Controls.Add(this.txtTheoMa);
            this.Controls.Add(this.btnTimkiem);
            this.Controls.Add(this.rdHienAll);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.lbTitle);
            this.Controls.Add(this.dataGridView1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "timKiem";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Tìm kiếm";
            this.Load += new System.EventHandler(this.inSinhVien_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label lbTitle;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.RadioButton rdHienAll;
        private System.Windows.Forms.Button btnTimkiem;
        private System.Windows.Forms.TextBox txtTheoMa;
        private System.Windows.Forms.TextBox txtTheoTen;
        private System.Windows.Forms.CheckBox ckMa;
        private System.Windows.Forms.CheckBox ckTen;
    }
}
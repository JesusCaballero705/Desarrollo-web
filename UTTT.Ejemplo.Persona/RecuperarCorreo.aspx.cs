using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EASendMail;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control.Ctrl;
using UTTT.Ejemplo.Persona.Modelo;

namespace UTTT.Ejemplo.Persona
{
    public partial class RecuperarCorreo : System.Web.UI.Page
    {
        BDPersonaEntities bd = new BDPersonaEntities();
        DataContext dcGuardar = new DcGeneralDataContext();
        string url;
        private UTTT.Ejemplo.Linq.Data.Entity.Usuario baseEntity;
        private DataContext dcGlobal = new DcGeneralDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var usuario = bd.Persona.FirstOrDefault(x => x.strCorreo == txtCorreo.Text);
                if (usuario != null)
                {
                    var usu2 = bd.Usuario.FirstOrDefault(u => u.idComPersona == usuario.id);
                    string correo = usuario.strCorreo.ToString();
                    
                    string tak = Token();
                    CorreoE(tak, correo);
                    this.baseEntity = dcGlobal.GetTable<Linq.Data.Entity.Usuario>().First(c => c.id == usu2.id);
                    DataContext dcGuardar = new DcGeneralDataContext();
                    UTTT.Ejemplo.Linq.Data.Entity.Usuario user = new Linq.Data.Entity.Usuario();
                    if (dcGlobal != null)
                    {
                        user = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuario>().First(u => u.id == usu2.id);
                        var tok = tak;
                        Session["open"] = tok.ToString().Trim();
                        user.token = tok.ToString().Trim();
                        var net = Session["open"].ToString();
                        dcGuardar.SubmitChanges();
                        this.lblMessage.Text = "Se envio un correo de recuperacion" +
                            "revisa tu vandeja y lee la bandeja" ;
                    }

                }
                else
                {
                    this.lblMessage.Text = "El correo no esta registrado";
                }

            }
            catch (Exception ex)
            {
                this.lblMessage.Text = ex.Message;
            }
        }

        public new void CorreoE(string error, string correo)

        {
            string EmailOrigen = "jebush.jh@gmail.com";
            string EmailDestino = correo;
            string contra = "jebush69";
            url = "http://www.Ejemplopersona.somee.com/Recuperacion.aspx?token=" + error;

            MailMessage oMailMessage = new MailMessage(EmailOrigen, EmailDestino,
                "Recuperacion de contraseña. ",
                 "<p><Correo para la recuperacion de contraseña </p> </br>" + "<a href=" + url + "> -->Click Aqui<--- </a>");
            
            oMailMessage.IsBodyHtml = true;
            System.Net.Mail.SmtpClient oSmtpClient = new System.Net.Mail.SmtpClient("smtp.gmail.com");
            oSmtpClient.EnableSsl = true;
            oSmtpClient.UseDefaultCredentials = false;
            oSmtpClient.Port = 587;
            oSmtpClient.Credentials = new System.Net.NetworkCredential("jebush.jh@gmail.com", "jebush69");

            oSmtpClient.Send(oMailMessage);

            oMailMessage.Dispose();
        }
        public static string Token()
        {
            long i = 1;
            foreach (byte b in Guid.NewGuid().ToByteArray()) i *= ((int)b + 1);
            
            return MD5(string.Format("{0:x}", i - DateTime.Now.Ticks));
        }
        public static string MD5(string word)
        {
            MD5 md5 = MD5CryptoServiceProvider.Create();
            ASCIIEncoding encoding = new ASCIIEncoding();

            byte[] stream = null;
            StringBuilder sb = new StringBuilder();
            stream = md5.ComputeHash(encoding.GetBytes(word));
            for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
            return sb.ToString();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/login.aspx", false);
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un error");
                this.showMessageException(_e.Message);
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {

        }
    }
}
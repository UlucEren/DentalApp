﻿using System.ComponentModel.DataAnnotations;

namespace Entities.Concrete
{
    public class AccountsTreatments
    {
        [Key]
        public string Id { get; set; }
        public string Treatment { get; set; }
        public decimal Price { get; set; }
        public int Vat { get; set; }
        public decimal PriceWithVat { get; set; }
        public decimal Cost { get; set; }
        public DateTime Date { get; set; }
        public string Teet { get; set; }
        public string Accounts_AspNetUsers_Id_Fk { get; set; }
        public string AccountPatients_Id_Fk { get; set; }
        public string AccountsTariffLists_Id_Fk { get; set; }
        public string AccountsDiagnozLists_Id_Fk { get; set; }
        public int ActionLists_Id_Fk { get; set; }
        public string Doctor_SubAccounts_AspNetUsers_Id_Fk { get; set; } 
        public string Comment { get; set; } 
    }
}

using Microsoft.AspNetCore.Identity;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebUI.Models.AppIdentityDb
{
    public class RoleTableIndexs
    {
        [Key, MaxLength(450)]
        public string RoleId { get; set; }
        
        public float TableIndex { get; set; }
    }
}
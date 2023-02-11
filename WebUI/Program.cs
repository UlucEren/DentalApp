using Autofac.Core;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using WebUI.Models.AppIdentityDb;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews().AddRazorRuntimeCompilation();

//builder.Services.AddDbContext<AppIdentityDbContext>(options =>
//            options.UseSqlServer(@"Data Source=DESKTOP-Q2ICC8E\SQLEXPRESS;Initial Catalog=DentalAppDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False"));

builder.Services.AddDbContext<AppIdentityDbContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnectionString"));
});

builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie(CookieAuthenticationDefaults.AuthenticationScheme,
        options =>
        {
            var cookieBuilder = new CookieBuilder();
            cookieBuilder.Name = "DentalAppCookie";
            options.LoginPath = new PathString("/Account/Login");
            options.LogoutPath = new PathString("/Account/logout");
            options.AccessDeniedPath = new PathString("/Account/AccessDenied");
            options.ExpireTimeSpan = TimeSpan.FromDays(60);
            options.SlidingExpiration = true;
            options.Cookie = cookieBuilder;

        });

//var cookie = builder.Services.ConfigureApplicationCookie(opt =>
//{
//    var cookieBuilder = new CookieBuilder();
//    cookieBuilder.Name = "DentalAppCookie";    
//    opt.LoginPath = new PathString("/Account/Login");
//    opt.LogoutPath = new PathString("/Account/logout");
//    opt.AccessDeniedPath = new PathString("/Account/AccessDenied");
//    opt.Cookie = cookieBuilder;
//    opt.ExpireTimeSpan = TimeSpan.FromDays(60);
//    opt.SlidingExpiration = true;
//});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

//SeedIdentity.Seed(userManager, roleManager, Configuration).Wait();

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();
app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();

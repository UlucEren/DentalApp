using Autofac;
using Autofac.Extensions.DependencyInjection;
using Autofac.Core;
using Business.Abstract;
using Business.Authentication;
using Business.DependencyResolvers.Autofac;
using Business.Repositories.UserRepository;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System.Security;
using WebUI.Models.AppIdentityDb;

var builder = WebApplication.CreateBuilder(args);

//builder.Host.UseServiceProviderFactory(new AutofacServiceProviderFactory());
//builder.Host.ConfigureContainer<ContainerBuilder>(builder => builder.RegisterModule(new AutofacBusinessModule()));

// Add services to the container.
builder.Services.AddControllersWithViews().AddRazorRuntimeCompilation();

//builder.Services.AddDbContext<AppIdentityDbContext>(options =>
//            options.UseSqlServer(@"Data Source=DESKTOP-Q2ICC8E\SQLEXPRESS;Initial Catalog=DentalAppDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False"));

builder.Services.AddDbContext<AppIdentityDbContext>(options =>
{
	options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnectionString"));
});

builder.Services.AddIdentity<AppUser, AppRole>(options =>
{
	options.Stores.ProtectPersonalData = false;
	options.Password.RequireDigit = true;
	options.Password.RequiredLength = 6;
	options.Password.RequireNonAlphanumeric = false;
	options.Password.RequireUppercase = false;
	options.Password.RequireLowercase = false;
	options.User.RequireUniqueEmail = true;
	//options.User.AllowedUserNameCharacters = "abcçdefgðhýijklmnoçpqrsþtuüvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._";
})
	.AddEntityFrameworkStores<AppIdentityDbContext>()
	.AddRoleManager<RoleManager<AppRole>>()
	.AddDefaultTokenProviders();

builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
	.AddCookie(CookieAuthenticationDefaults.AuthenticationScheme,
		options =>
		{
			var cookieBuilder = new CookieBuilder();
			cookieBuilder.Name = "DentalAppCookie";
			cookieBuilder.HttpOnly = true;
			cookieBuilder.SameSite = SameSiteMode.Strict;
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
//builder.Services.AddScoped<IAuthenticationService, AuthenticationManager>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
	app.UseExceptionHandler("/Home/Error");
	// The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
	app.UseHsts();
}

using (var scope = app.Services.CreateScope())
{
	var roleManager = scope.ServiceProvider.GetRequiredService<RoleManager<AppRole>>();
	var userManager = scope.ServiceProvider.GetRequiredService<UserManager<AppUser>>();
	var Configuration = builder.Configuration;

	await SeedIdentity.Seed(userManager, roleManager, Configuration);
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();
app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
	name: "default",
	pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();


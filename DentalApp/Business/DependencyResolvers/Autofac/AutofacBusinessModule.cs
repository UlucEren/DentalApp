using Autofac;
using Autofac.Extras.DynamicProxy;
using Business.Abstract;
using Business.Authentication;
using Business.Repositories.EmailParameterRepository;
using Business.Repositories.OperationClaimRepository;
using Business.Repositories.UserOperationClaimRepository;
using Business.Repositories.UserRepository;
using Core.Utilities.Interceptors;
using Core.Utilities.Security.JWT;
using DataAccess.Repositories.EmailParameterRepository;
using DataAccess.Repositories.OperationClaimRepository;
using DataAccess.Repositories.UserOperationClaimRepository;
using DataAccess.Repositories.UserRepository;
using Entities.Concrete;
using Business.Repositories.AccountsTariffNamesRepository;
using DataAccess.Repositories.AccountsTariffNamesRepository;
using Business.Repositories.AccountsTariffNamesCategoriesRepository;
using DataAccess.Repositories.AccountsTariffNamesCategoriesRepository;
using Business.Repositories.AccountsTariffListsRepository;
using DataAccess.Repositories.AccountsTariffListsRepository;
using Business.Repositories.TDBCostNamesRepository;
using DataAccess.Repositories.TDBCostNamesRepository;
using Business.Repositories.TDBCostNameCategoriesRepository;
using DataAccess.Repositories.TDBCostNameCategoriesRepository;
using Business.Repositories.TDBCostListsRepository;
using DataAccess.Repositories.TDBCostListsRepository;
using Business.Repositories.AccountPatientsRepository;
using DataAccess.Repositories.AccountPatientsRepository;
using Business.Repositories.AccountsRepository;
using DataAccess.Repositories.AccountsRepository;
using Business.Repositories.SubAccountsRepository;
using DataAccess.Repositories.SubAccountsRepository;
using Business.Repositories.ActionListRepository;
using DataAccess.Repositories.ActionListRepository;
using Business.Repositories.AccountTreatmentsRepository;
using DataAccess.Repositories.AccountTreatmentsRepository;
using Business.Repositories.AspNetUsersRepository;
using DataAccess.Repositories.AspNetUsersRepository;
using Microsoft.AspNetCore.Identity;

namespace Business.DependencyResolvers.Autofac
{
    public class AutofacBusinessModule : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterType<OperationClaimManager>().As<IOperationClaimService>();
            builder.RegisterType<EfOperationClaimDal>().As<IOperationClaimDal>();

            builder.RegisterType<UserManager>().As<IUserService>();
            builder.RegisterType<EfUserDal>().As<IUserDal>();

            builder.RegisterType<UserOperationClaimManager>().As<IUserOperationClaimService>();
            builder.RegisterType<EfUserOperationClaimDal>().As<IUserOperationClaimDal>();

            builder.RegisterType<EmailParameterManager>().As<IEmailParameterService>();
            builder.RegisterType<EfEmailParameterDal>().As<IEmailParameterDal>();

            builder.RegisterType<AuthManager>().As<IAuthService>();

            builder.RegisterType<TokenHandler>().As<ITokenHandler>();

			//builder.RegisterType<SignInManager<AspNetUsers>>().AsSelf().InstancePerLifetimeScope();
			//builder.RegisterType<UserManager<AspNetUsers>>().AsSelf().InstancePerLifetimeScope();


			//builder.RegisterType<AuthenticationManager>().As<IAuthenticationService>();

            builder.RegisterType<AccountsTariffNamesManager>().As<IAccountsTariffNamesService>().SingleInstance();
            builder.RegisterType<EfAccountsTariffNamesDal>().As<IAccountsTariffNamesDal>().SingleInstance();

            builder.RegisterType<AccountsTariffNamesCategoriesManager>().As<IAccountsTariffNamesCategoriesService>().SingleInstance();
            builder.RegisterType<EfAccountsTariffNamesCategoriesDal>().As<IAccountsTariffNamesCategoriesDal>().SingleInstance();

            builder.RegisterType<AccountsTariffListsManager>().As<IAccountsTariffListsService>().SingleInstance();
            builder.RegisterType<EfAccountsTariffListsDal>().As<IAccountsTariffListsDal>().SingleInstance();

            builder.RegisterType<TDBCostNamesManager>().As<ITDBCostNamesService>().SingleInstance();
            builder.RegisterType<EfTDBCostNamesDal>().As<ITDBCostNamesDal>().SingleInstance();

            builder.RegisterType<TDBCostNameCategoriesManager>().As<ITDBCostNameCategoriesService>().SingleInstance();
            builder.RegisterType<EfTDBCostNameCategoriesDal>().As<ITDBCostNameCategoriesDal>().SingleInstance();

            builder.RegisterType<TDBCostListsManager>().As<ITDBCostListsService>().SingleInstance();
            builder.RegisterType<EfTDBCostListsDal>().As<ITDBCostListsDal>().SingleInstance();

            builder.RegisterType<AccountPatientsManager>().As<IAccountPatientsService>().SingleInstance();
            builder.RegisterType<EfAccountPatientsDal>().As<IAccountPatientsDal>().SingleInstance();

            builder.RegisterType<AccountsManager>().As<IAccountsService>().SingleInstance();
            builder.RegisterType<EfAccountsDal>().As<IAccountsDal>().SingleInstance();

            builder.RegisterType<SubAccountsManager>().As<ISubAccountsService>().SingleInstance();
            builder.RegisterType<EfSubAccountsDal>().As<ISubAccountsDal>().SingleInstance();

            builder.RegisterType<ActionListsManager>().As<IActionListsService>().SingleInstance();
            builder.RegisterType<EfActionListsDal>().As<IActionListsDal>().SingleInstance();

            builder.RegisterType<AccountTreatmentsManager>().As<IAccountTreatmentsService>().SingleInstance();
            builder.RegisterType<EfAccountTreatmentsDal>().As<IAccountTreatmentsDal>().SingleInstance();

            builder.RegisterType<AspNetUsersManager>().As<IAspNetUsersService>().SingleInstance();
            builder.RegisterType<EfAspNetUsersDal>().As<IAspNetUsersDal>().SingleInstance();

            var assembly = System.Reflection.Assembly.GetExecutingAssembly();

            builder.RegisterAssemblyTypes(assembly).AsImplementedInterfaces().EnableInterfaceInterceptors(new Castle.DynamicProxy.ProxyGenerationOptions()
            {
                Selector = new AspectInterceptorSelector()
            }).SingleInstance();
        }
    }
}

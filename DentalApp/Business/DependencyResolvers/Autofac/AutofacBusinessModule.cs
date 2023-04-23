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

            var assembly = System.Reflection.Assembly.GetExecutingAssembly();

            builder.RegisterAssemblyTypes(assembly).AsImplementedInterfaces().EnableInterfaceInterceptors(new Castle.DynamicProxy.ProxyGenerationOptions()
            {
                Selector = new AspectInterceptorSelector()
            }).SingleInstance();
        }
    }
}

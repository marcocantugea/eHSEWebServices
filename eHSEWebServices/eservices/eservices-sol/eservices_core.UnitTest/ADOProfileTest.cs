using System;
using System.Collections.Generic;
using System.Collections;
using NUnit.Framework;
using eservices_core.com.ado;
using eservices_core.com.objects;
namespace eservices_core.UnitTest
{
    [TestFixture]
    public class ADOProfileTest
    {
        [Test]
        public void ADOProfileTest_LoadModules_errorboolean()
        {
            UserObj user = new UserObj { userid = 3 };

            try
            {
                ADOUser ADOUser = new ADOUser();
                ADOUser.GetUserByID(user);
                user.Loadinfo();
                Assert.That(user.ProfileObj != null, "Object Profile not set");
                Console.WriteLine(user.ProfileObj.idprofile);
                user.ProfileObj.LoadModules(true);
                Assert.That(user.ProfileObj.Modules!=null,"ModuleObj not set");
                Assert.That(user.ProfileObj.Modules.Count > 0);
               foreach(KeyValuePair<int,ModuleObj> module in user.ProfileObj.Modules ){
                   Assert.That(module.Value.label != null,"ModuleObj:label equals null");
                   Assert.That(module.Value.MenuList!=null,"MenuList Obj is null");
               }

            }
            catch (Exception)
            {

                throw;
            }
            

        }

        [Test]
        public void ADOProfileTest_GetAccessDeparments_ReturnListOfIdDeparments() {
            ADOProfile ADOProfile = new ADOProfile();
            List<int> result = ADOProfile.GetAccessDeparments(3);
            foreach (var u in result) {
                Console.WriteLine(u);
            }
            Assert.IsNotNull(result, "The result var is empty");

        }
        [Test]
        public void ADOProfileTest_ProfileObj_ReturnListOfIdDeparments() {
            ProfileObj profile = new ProfileObj();
            profile.idprofile = 2;
            profile.GetAccessDeparments(3);
            foreach (var i in profile.AccessDeparments) { Console.WriteLine(i); }
            Assert.IsNotNull(profile.AccessDeparments, "The profile.accessDeparments is null");
        }
    }
}

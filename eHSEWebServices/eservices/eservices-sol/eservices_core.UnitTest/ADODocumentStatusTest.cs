using System;
//using Microsoft.VisualStudio.TestTools.UnitTesting;
using NUnit.Framework;
using eservices_core.com.ado;
using eservices_core.com.objects;
using System.Reflection;

namespace eservices_core.UnitTest
{
    [TestFixture]
    public class ADODocumentStatusTest
    {

        //[Test]
        public void AddDocumentStatus_AddrecordDatabase() {
            
            //Assets
            DocumentStatusObj newstatus = new DocumentStatusObj { label = "test", active=true, status="status" };
            ADODocumentStatus ADODocumentStatus = new ADODocumentStatus();

            //Action
            try
            {
                 //ADODocumentStatus.AddDocumentStatus(newstatus);
                 Console.WriteLine(newstatus.idDocumentStatus);

            }
            catch (Exception)
            {
                
                throw;
            }   
         
            //Asserts
            //Assert.That(newstatus.idDocumentStatus > 0);
        }

        [Test]
        public void GetDocumentStatusByID_ObtainAllDataToAObject() {
            //Assets
            DocumentStatusObj newstatus = new DocumentStatusObj { idDocumentStatus=1 };
            ADODocumentStatus ADODocumentStatus = new ADODocumentStatus();

            //Action
            try
            {
               
                ADODocumentStatus.GetDocumentStatusByID(newstatus);
                foreach (PropertyInfo property in newstatus.GetType().GetProperties()) {
                    Console.WriteLine("Property Name: {0} value {1}" , property.Name,property.GetValue(newstatus));
                    Assert.That(property.GetValue(newstatus) != null);
                }

            }
            catch (Exception)
            {

                throw;
            }   
        }
       
    }
}

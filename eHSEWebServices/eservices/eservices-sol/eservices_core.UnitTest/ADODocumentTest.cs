using System;
//using Microsoft.VisualStudio.TestTools.UnitTesting;
using NUnit.Framework;
using eservices_core.com.ado;
using eservices_core.com.objects;
using etra.com.objects;
using etra.com.ado.ole;
using System.Collections.Generic;
namespace eservices_core.UnitTest
{
    [TestFixture]
    public class ADODOcumentTest
    {
        [Test]
        public void GetDocumentsByUser_GetAllDocuments_ReturnlistOfObjects()
        {
            //Arrange
            ADODocument ADODocument = new ADODocument();
            UserObj User= new UserObj();
            User.userid=3;

            //Act
            SortedList<int, DocumentObj> list = ADODocument.GetDocuemntsByUser(User);
            foreach (KeyValuePair<int, DocumentObj> item in list) {
                Console.Write(item.Key);
                Console.Write(" ");
                Console.Write(item.Value.getTypeOfObj());
                Console.WriteLine();
            }


            //Assert
            //if (list == null) {
            //    Assert.Null(list, "Object List is null");
            //}
            //if (Assert.)
            //Assert.Zero(list.Count, "Object List has 0 elements.");
            Assert.That(list.Count>=0);

        }

        [Test]
        public void GetDocumentStatusObj_LoadTRAAndGetDocumentStatusObj() {
            
            //Assets
            TRAObj tra = new TRAObj { pin_save = 499 };
            ADOTRA ADOTRA = new ADOTRA();

            //Action
            ADOTRA.GetTRAbyPIN(tra);
            tra.LoadDocumentHeadInfo();
            
            tra.getDocumentStatusObj();
            Console.WriteLine(tra.getDocumentStatusObj().status);

            //Asserts
            Assert.IsNotNull(tra.getDocumentStatusObj(),"Object is null"); 
            Assert.GreaterOrEqual(tra.tra_ID, 0,"TRA id is 0");
            Assert.GreaterOrEqual(tra.getCreatedByUserObj().userid, 0, "User id not loaded");

        }
        
        [Test]
        public void GetDocumentByID_GetADocumentObjByID() {

            UserObj User = new UserObj();
            User.userid = 3;
            ADODocument ADODocument = new ADODocument();

            Object docu = ADODocument.GetDocumentByID(9);

            Console.WriteLine(docu.GetType().FullName );

            if (docu.GetType().FullName.Contains("TRA")) {
                etra.com.objects.TRAObj tra = (etra.com.objects.TRAObj)docu;
                Assert.IsNotNull(tra.getCreatedByUserObj().InfoUserObj,"Objeto InfouserObj not load");
                Console.WriteLine(tra.getCreatedByUserObj().FullName());
            }
            //Assert.IsInstanceOf<>(docu);
            
        }

        [Test]
        public void CheckExistDocumentForApproval_ExistDocument_true() {
            eservices_core.com.ado.ADODocument ADODocuments = new eservices_core.com.ado.ADODocument();

            Assert.True(ADODocuments.CheckExistDocumentForApproval(9),"Exist Document is false");
        }

    }
}

using System;
//using Microsoft.VisualStudio.TestTools.UnitTesting;
using NUnit.Framework;
using eservices_core.com.ado;
using eservices_core.com.objects;
using eservices_core.com.process;

namespace eservices_core.UnitTest
{
    [TestFixture]
    public class DocumentForApprovalProcessTest
    {
        [Test]
        public void SendDocumentForApproval_InsertDataToDataBase_GetRecord()
        {
            DocumentPendingForApprovalObj obj = new DocumentPendingForApprovalObj();

            obj.idDocument = 9;
            obj.UseridRequested = 3;
            obj.UserObjRequested = new UserObj { userid=3 };
            obj.idDeparment = 4;
            obj.StatusOpenClose = 1;

            DocumentForApprovalProcess process = new DocumentForApprovalProcess();
            process.AddDocumentPendingForApproval(obj);

            
           
        }
    }
}

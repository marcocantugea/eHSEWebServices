DROP VIEW IF EXISTS vw_documentsforapproval;

CREATE VIEW 
	vw_documentsforapproval 
AS
SELECT 
	docapp.idPendingForApproval,
    docapp.idDocument,
    doc.DocumentDate,
    doc.DocumentAprovalDate,
    doc.TypeOfObj,
	doc.IDObjField,
    doc.IdOfDocument,
    doc.eSignatureFile,
    doc.userid,
    doc.idDocumentStatus,
    doc.locked,
    docapp.UseridRequested,
    concat(userinfo.Nombre , ' ' , userinfo.apellido_pat , ' ', userinfo.apellido_mat) AS UserNameRequested,
    docapp.StatusOpenClose,
    dep.idDeparment,
    dep.DeparmentName,
    dep.cDep_Id
FROM tbl_documentspengindforapproval AS docapp
LEFT JOIN tbl_documents AS doc ON doc.idDocument=docapp.idDocument
LEFT JOIN tbl_userslogin AS user ON user.userid= docapp.UseridRequested
LEFT JOIN tbl_infouser AS userinfo ON userinfo.idInfoUser= user.idInfoUser
LEFT JOIN tbl_deparments AS dep ON dep.idDeparment=docapp.idDeparment
WHERE docapp.StatusOpenClose=1;
; 
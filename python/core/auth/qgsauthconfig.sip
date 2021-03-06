/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/auth/qgsauthconfig.h                                        *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/






class QgsAuthMethodConfig
{
%Docstring
 Configuration storage class for authentication method configurations
%End

%TypeHeaderCode
#include "qgsauthconfig.h"
%End
  public:

    QgsAuthMethodConfig( const QString &method = QString(), int version = 0 );
%Docstring
 Construct a configuration for an authentication method
 \param method Textual key of the authentication method
 \param version Version of the configuration (for updating previously saved configs later on)
%End

    bool operator==( const QgsAuthMethodConfig &other ) const;

    bool operator!=( const QgsAuthMethodConfig &other ) const;
%Docstring
Operator used to compare configs' inequality
 :rtype: bool
%End

    const QString id() const;
%Docstring
 Get 'authcfg' 7-character alphanumeric ID of the config
.. note::

   This is set by QgsAuthManager when the config is initially stored
 :rtype: str
%End
    void setId( const QString &id );
%Docstring
Set auth config ID
%End

    const QString name() const;
%Docstring
Get name of configuration
 :rtype: str
%End
    void setName( const QString &name );
%Docstring
Set name of configuration
%End

    const QString uri() const;
%Docstring
A URI to auto-select a config when connecting to a resource
 :rtype: str
%End
    void setUri( const QString &uri );

    QString method() const;
%Docstring
Textual key of the associated authentication method
 :rtype: str
%End
    void setMethod( const QString &method );

    int version() const;
%Docstring
Get version of the configuration
 :rtype: int
%End
    void setVersion( int version );
%Docstring
Set version of the configuration
%End

    bool isValid( bool validateid = false ) const;
%Docstring
 Whether the configuration is valid
 \param validateid Additionally verify the auth config ID is not empty
 :rtype: bool
%End

    const QString configString() const;
%Docstring
 The extended configuration, as stored and retrieved from the authentication database
.. note::

   This is an internal construct used by QgsAuthManager that should generally not be set by client code
 :rtype: str
%End

    void loadConfigString( const QString &configstr );
%Docstring
 Load existing extended configuration
 \param configstr Configuration string to load
%End

    QgsStringMap configMap() const;
%Docstring
Get extended configuration, mapped to key/value pairs of QStrings
 :rtype: QgsStringMap
%End

    void setConfigMap( const QgsStringMap &map );
%Docstring
 Set extended configuration map
 \param map Map to set
%End

    void setConfig( const QString &key, const QString &value );
%Docstring
 Set a single config value per key in the map
.. note::

   if key exists, it is replaced
 \param key Config key
 \param value Config value
%End

    void setConfigList( const QString &key, const QStringList &value );
%Docstring
 Set a multiple config values per key in the map
.. note::

   if key exists, it is replaced
 \param key Config key
 \param value Config value
%End

    int removeConfig( const QString &key );
%Docstring
 Remove a config from map
 \param key Config to remove
 :return: Number of keys removed (should always be 1 or 0)
 :rtype: int
%End

    QString config( const QString &key, const QString &defaultvalue = QString() ) const;
%Docstring
 Return a config's value
 \param key Config key
 \param defaultvalue Default value, if key not found
 :rtype: str
%End

    QStringList configList( const QString &key ) const;
%Docstring
 Return a config's list of values
 \param key
 :rtype: list of str
%End

    bool hasConfig( const QString &key ) const;
%Docstring
 Whether a config key exists in config map
 \param key
 :rtype: bool
%End

    void clearConfigMap();
%Docstring
Clear all configs
%End

    static bool uriToResource( const QString &accessurl, QString *resource, bool withpath = false );
%Docstring
 A utility function for generating a resource from a URL to be compared
 against the config's uri() for auto-selecting authentication configs to use
.. note::

   Essentially strips the URL query variables, and by default, strips the path as well
 \param accessurl A URL to process
 \param resource Output variable for result
 \param withpath Whether to include the URI's path in output
 :rtype: bool
%End

};

typedef QHash<QString, QgsAuthMethodConfig> QgsAuthMethodConfigsMap;



class QgsPkiBundle
{
%Docstring
 Storage set for PKI bundle: SSL certificate, key, optional CA cert chain
.. note::

   Useful for caching the bundle during application run sessions
%End

%TypeHeaderCode
#include "qgsauthconfig.h"
%End
  public:

    QgsPkiBundle( const QSslCertificate &clientCert = QSslCertificate(),
                  const QSslKey &clientKey = QSslKey(),
                  const QList<QSslCertificate> &caChain = QList<QSslCertificate>() );
%Docstring
 Construct a bundle from existing PKI components
 \param clientCert Certificate to store in bundle
 \param clientKey Private key to store in bundle
 \param caChain Chain of Certificate Authorities for client certificate
%End

    static const QgsPkiBundle fromPemPaths( const QString &certPath,
                                            const QString &keyPath,
                                            const QString &keyPass = QString::null,
                                            const QList<QSslCertificate> &caChain = QList<QSslCertificate>() );
%Docstring
 Construct a bundle of PKI components from PEM-formatted file paths
 \param certPath Certificate file path
 \param keyPath Private key path
 \param keyPass Private key passphrase
 \param caChain Chain of Certificate Authorities for client certificate
 :rtype: QgsPkiBundle
%End

    static const QgsPkiBundle fromPkcs12Paths( const QString &bundlepath,
        const QString &bundlepass = QString::null );
%Docstring
 Construct a bundle of PKI components from a PKCS#12 file path
 \param bundlepath Bundle file path
 \param bundlepass Optional bundle passphrase
 :rtype: QgsPkiBundle
%End

    bool isNull() const;
%Docstring
Whether the bundle, either its certificate or private key, is null
 :rtype: bool
%End

    bool isValid() const;
%Docstring
Whether the bundle is valid
 :rtype: bool
%End

    const QString certId() const;
%Docstring
The sha hash of the client certificate
 :rtype: str
%End

    const QSslCertificate clientCert() const;
%Docstring
Client certificate object
 :rtype: QSslCertificate
%End
    void setClientCert( const QSslCertificate &cert );
%Docstring
Set client certificate object
%End

    const QSslKey clientKey() const;
%Docstring
Private key object
 :rtype: QSslKey
%End
    void setClientKey( const QSslKey &certkey );
%Docstring
Set private key object
%End

    const QList<QSslCertificate> caChain() const;
%Docstring
Chain of Certificate Authorities for client certificate
 :rtype: list of QSslCertificate
%End
    void setCaChain( const QList<QSslCertificate> &cachain );
%Docstring
Set chain of Certificate Authorities for client certificate
%End

};


class QgsPkiConfigBundle
{
%Docstring
 Storage set for constructed SSL certificate, key, associated with an authentication config
%End

%TypeHeaderCode
#include "qgsauthconfig.h"
%End
  public:

    QgsPkiConfigBundle( const QgsAuthMethodConfig &config,
                        const QSslCertificate &cert,
                        const QSslKey &certkey );
%Docstring
 Construct a bundle from existing PKI components and authentication method configuration
 \param config Authentication method configuration
 \param cert Certificate to store in bundle
 \param certkey Private key to store in bundle
%End

    bool isValid();
%Docstring
Whether the bundle is valid
 :rtype: bool
%End

    const QgsAuthMethodConfig config() const;
%Docstring
Authentication method configuration
 :rtype: QgsAuthMethodConfig
%End
    void setConfig( const QgsAuthMethodConfig &config );
%Docstring
Set authentication method configuration
%End

    const QSslCertificate clientCert() const;
%Docstring
Client certificate object
 :rtype: QSslCertificate
%End
    void setClientCert( const QSslCertificate &cert );
%Docstring
Set client certificate object
%End

    const QSslKey clientCertKey() const;
%Docstring
Private key object
 :rtype: QSslKey
%End
    void setClientCertKey( const QSslKey &certkey );
%Docstring
Set private key object
%End

};



%MappedType QList<QSslError::SslError>
{
%TypeHeaderCode
#include <QList>
%End

%ConvertFromTypeCode
  // Create the list.
  PyObject *l;

  if ( ( l = PyList_New( sipCpp->size() ) ) == NULL )
    return NULL;

  // Set the list elements.
  QList<QSslError::SslError>::iterator it = sipCpp->begin();
  for ( int i = 0; it != sipCpp->end(); ++it, ++i )
  {
    PyObject *tobj;

    if ( ( tobj = sipConvertFromEnum( *it, sipType_QSslError_SslError ) ) == NULL )
    {
      Py_DECREF( l );
      return NULL;
    }
    PyList_SET_ITEM( l, i, tobj );
  }

  return l;
%End

%ConvertToTypeCode
  // Check the type if that is all that is required.
  if ( sipIsErr == NULL )
    return PyList_Check( sipPy );

  QList<QSslError::SslError> *qlist = new QList<QSslError::SslError>;

  for ( int i = 0; i < PyList_GET_SIZE( sipPy ); ++i )
  {
    *qlist << ( QSslError::SslError )SIPLong_AsLong( PyList_GET_ITEM( sipPy, i ) );
  }

  *sipCppPtr = qlist;
  return sipGetState( sipTransferObj );
%End
};



class QgsAuthConfigSslServer
{
%Docstring
 Configuration container for SSL server connection exceptions or overrides
%End

%TypeHeaderCode
#include "qgsauthconfig.h"
%End
  public:
    QgsAuthConfigSslServer();
%Docstring
Construct a default SSL server configuration
%End

    const QSslCertificate sslCertificate() const;
%Docstring
Server certificate object
 :rtype: QSslCertificate
%End
    void setSslCertificate( const QSslCertificate &cert );
%Docstring
Set server certificate object
%End

    const QString sslHostPort() const;
%Docstring
Server host:port string
 :rtype: str
%End
    void setSslHostPort( const QString &hostport );
%Docstring
Set server host:port string
%End

    QSsl::SslProtocol sslProtocol() const;
%Docstring
SSL server protocol to use in connections
 :rtype: QSsl.SslProtocol
%End
    void setSslProtocol( QSsl::SslProtocol protocol );
%Docstring
Set SSL server protocol to use in connections
%End

    const QList<QSslError> sslIgnoredErrors() const;
%Docstring
SSL server errors to ignore in connections
 :rtype: list of QSslError
%End
    const QList<QSslError::SslError> sslIgnoredErrorEnums() const;
%Docstring
SSL server errors (as enum list) to ignore in connections
 :rtype: list of QSslError.SslError
%End
    void setSslIgnoredErrorEnums( const QList<QSslError::SslError> &errors );
%Docstring
Set SSL server errors (as enum list) to ignore in connections
%End

    QSslSocket::PeerVerifyMode sslPeerVerifyMode() const;
%Docstring
SSL client's peer verify mode to use in connections
 :rtype: QSslSocket.PeerVerifyMode
%End
    void setSslPeerVerifyMode( QSslSocket::PeerVerifyMode mode );
%Docstring
Set SSL client's peer verify mode to use in connections
%End

    int sslPeerVerifyDepth() const;
%Docstring
 Number or SSL client's peer to verify in connections
.. note::

   When set to 0 = unlimited depth
 :rtype: int
%End

    void setSslPeerVerifyDepth( int depth );
%Docstring
 Set number or SSL client's peer to verify in connections
.. note::

   When set to 0 = unlimited depth
%End

    int version() const;
%Docstring
Version of the configuration (used for future upgrading)
 :rtype: int
%End
    void setVersion( int version );
%Docstring
Set version of the configuration (used for future upgrading)
%End

    int qtVersion() const;
%Docstring
Qt version when the configuration was made (SSL protocols may differ)
 :rtype: int
%End
    void setQtVersion( int version );
%Docstring
Set Qt version when the configuration was made (SSL protocols may differ)
%End

    const QString configString() const;
%Docstring
Configuration as a concatenated string
 :rtype: str
%End
    void loadConfigString( const QString &config = QString() );
%Docstring
Load concatenated string into configuration, e.g. from auth database
%End

    bool isNull() const;
%Docstring
Whether configuration is null (missing components)
 :rtype: bool
%End

};

/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/auth/qgsauthconfig.h                                        *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/

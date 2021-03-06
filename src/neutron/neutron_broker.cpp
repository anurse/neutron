#include "common.h"
#include "neutron_broker.h"

neutron_broker::neutron_broker()
{
}

bool neutron_broker::Get(const CefString & name, const CefRefPtr<CefV8Value> object, CefRefPtr<CefV8Value>& retval, CefString & exception)
{
    base::string16 message = u"called: "_x;
    message.append(name.c_str());
    retval = CefV8Value::CreateString(message);
    return true;
}

bool neutron_broker::Set(const CefString & name, const CefRefPtr<CefV8Value> object, const CefRefPtr<CefV8Value> value, CefString & exception)
{
    return false;
}

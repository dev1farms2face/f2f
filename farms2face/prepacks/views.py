from django.shortcuts import render
from home.views import cart_size, get_valid_user_data
from home.models import PrePack, FacePack
import pdb

# Create your views here.

def prepacks(request, id):
    p = PrePack.objects.first()
    if len(PrePack.objects.filter(facepack__id=id)) == 1:
        p = PrePack.objects.get(facepack__id=id)
    data = { 'valid_user': get_valid_user_data(request),
             'cart_size' : cart_size(request),
             'p'         : p.facepack,
             'prepacks'  : [{
                             'facepack' : i.facepack,
                             'cart_type': request.user.cart_set.get(item=i.facepack).type \
                                 if hasattr(request.user, 'cart_set') and \
                                 request.user.cart_set.filter(item=i.facepack).count() > 0 \
                                 else None
                           } for i in PrePack.objects.all() if i != p], 
    }
    if cart_size(request) > 0:
        for fp in FacePack.objects.filter(pk=id):
            if request.user.cart_set.filter(item=fp).count() > 0:
                cart_type = request.user.cart_set.get(item=fp).type
                data['fp'] = fp.id
                data['fp_type'] = cart_type
    return render(request, "prepacks.html", data)

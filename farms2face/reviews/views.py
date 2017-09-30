from django.shortcuts import render, get_list_or_404, redirect

from django.http import HttpResponse
from django.contrib.auth.models import User
from reviews.models import Review
from facepackwizard.models import QuestionnaireUserData, QuestionnaireEntry, SkinType
from django.db.models import Q
from home.views import cart_size, get_valid_user_data
import random
import pdb
import json

def review_page(request, skin_type=""):
    reviews = []
    review_ids = []
    skin = skin_type
    if skin and SkinType.objects.filter(name=skin).count() > 0:
        cmd_str = "Q(question__id=7, option__name='%s')" % skin
        for qe in QuestionnaireEntry.objects.filter(eval(cmd_str)):
            for c in qe.wizard.customfacepack_set.all():
                review_set = c.facepack.review_set
                if not skin_type:
                    skin_type = c.recipe.skin_type.name
                if review_set.count() > 0:
                    for r in review_set.all():
                        if r.id not in review_ids:
                            user = r.ph.user
                            reviews.append({
                                'review'     : r,
                                'rating'     : range(r.rating),
                                'rating_neg' : range(5-r.rating),
                                'user_pic'   : user.profile.picture if hasattr(user, 'profile') and user.profile.picture else 'images/profile/default.png',
                                'fp'         : r.fp,
                                'pics'       : [{'url': ri.image.url, 'id': ri.id} for ri in r.reviewimage_set.all()],
                                'is_cfp'     : True,
                            })
                            review_ids.append(r.id)
    review_count = len(reviews)
    rating_avg = float(sum([int(r['review'].rating) for r in reviews]))/review_count if review_count > 0 else 0
    rating_avg_full = int(rating_avg)
    rating_avg_half = 0.0
    rating_avg_empty = 5 - int(rating_avg)
    if int(rating_avg) < rating_avg:
        rating_avg_half = round(rating_avg - rating_avg_full, 1)
        rating_avg_empty -= 1
    data = {
        'reviews'             : reviews,
        'count'               : review_count,
        'rating_avg_full'     : range(rating_avg_full),
        'rating_avg_half'     : rating_avg_half,
        'rating_avg_half_dec' : "".join(str(rating_avg_half).split('.')[1:]),
        'rating_avg_empty'    : range(rating_avg_empty),
        'skin_type'           : skin if skin else skin_type,
        'type'                : type,
        'cart_size' 	      : cart_size(request),
        'valid_user'	      : get_valid_user_data(request),
    }
    if not skin_type:
        skin_list = [i.name for i in SkinType.objects.all()]
        random.shuffle(skin_list)
        for skin in skin_list:
            cmd_str = "Q(question__id=7, option__name='%s')" % skin
            for qe in QuestionnaireEntry.objects.filter(eval(cmd_str)):
                for c in qe.wizard.customfacepack_set.all():
                    review_set = c.facepack.review_set
                    if review_set.count() > 0:
                        return redirect('/reviews/%s' % skin)
        return redirect('/reviews/Normal')
    return render(request, "review_page.html", data)

def vote(request):
    json_response = { 'success': False }
    if request.method == 'POST':
        user = request.user
        data = json.loads(request.POST['data'])
        r_id = data.get('r_id', None)
        vote = data.get('vote', None)
        if r_id and vote in ['up', 'down'] and Review.objects.filter(id=r_id).count() > 0:
            review = Review.objects.get(pk=r_id)
            if user:
                rstr = "review_%s" % r_id
                cached = request.session.get(rstr, None)
                if vote == 'up':
                    if not cached or cached == "down":
                        review.useful += 1
                        request.session[rstr] = "up"
                        if cached == "down":
                            review.not_useful -= 1
                    json_response['ret'] = review.useful
                if vote == 'down':
                    if not cached or cached == "up":
                        review.not_useful += 1
                        request.session[rstr] = "down"
                        if cached == "up":
                            review.useful -= 1
                    json_response['ret'] = review.not_useful
                review.save()
                json_response['success'] = True
                print(json_response)
    return HttpResponse(json.dumps(json_response, ensure_ascii=False))

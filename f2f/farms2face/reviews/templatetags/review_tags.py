from django import template
from home.models import *
from facepackwizard.models import QuestionnaireUserData, QuestionnaireEntry, SkinType
from django.db.models import Q
import pdb

register = template.Library()

@register.inclusion_tag('review_tag.html', takes_context=True)
def review_tags(context, id, type, skin=None):
    # For type : 'cfp' (Custom facePack)
    # Get related reviews based on id (qd_id  - questionnaire data) answered in 
    # previous step.
    #
    # For type: 'pp' (Pre pack)
    # Get PrePack ID from 'id'
    # Get any reviews for it.
    request = context['request']
    reviews = []
    review_ids = []
    skin_type = "" 
    if type == "cfp" and id:
        qd = QuestionnaireUserData.objects.get(pk=id);
        cmd_str = " and ".join(["Q(question__id=%d, option__id=%d)" % (qe.question.id, qe.option.id) \
                  for qe in QuestionnaireEntry.objects.filter(wizard=qd, question__id=7)])
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
    if type == "pp":
        if PrePack.objects.filter(facepack__id=id).count() > 0:
            pp = PrePack.objects.get(facepack__id=id)
            for r in pp.facepack.review_set.all():
                user = r.ph.user
                reviews.append({
                    'review'     : r,
                    'rating'     : range(r.rating),
                    'rating_neg' : range(5-r.rating),
                    'user_pic'   : user.profile.picture if hasattr(user, 'profile') and user.profile.picture else 'images/profile/default.png',
                    'fp'         : r.fp,
                    'pics'       : [{'url': ri.image.url, 'id': ri.id} for ri in r.reviewimage_set.all()],
                })
    review_count = len(reviews)
    rating_avg = float(sum([int(r['review'].rating) for r in reviews]))/review_count if review_count > 0 else 0
    rating_avg_full = int(rating_avg)
    rating_avg_half = 0.0
    rating_avg_empty = 5 - int(rating_avg)
    if int(rating_avg) < rating_avg:
        rating_avg_half = round(rating_avg - rating_avg_full, 1)
        rating_avg_empty -= 1
    ret = { 
        'reviews'             : reviews,
        'count'               : review_count,
        'rating_avg_full'     : range(rating_avg_full),
        'rating_avg_half'     : rating_avg_half,
        'rating_avg_half_dec' : "".join(str(rating_avg_half).split('.')[1:]),
        'rating_avg_empty'    : range(rating_avg_empty),
        'skin_type'           : skin if skin else skin_type,
        'type'                : type,
    }
    return ret



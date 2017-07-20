from django.shortcuts import render, get_list_or_404

from django.http import HttpResponse
from django.contrib.auth.models import User
from reviews.models import Review
import pdb
import json

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

{function name="render_star" rating=0}
    {$data.min = 1}
    {$data.max = 99999}
    {$data.random = "{math equation='rand(min, max)' min=$data.min max=$data.max}"}


    <svg xmlns="http://www.w3.org/2000/svg" xmlns:bx="https://boxy-svg.com" viewBox="528.439 240.04 11.177 10.682" width="11.177" height="10.682">
        <linearGradient id="MyGradient{$rating}{$data.random}">
            <stop offset="{$rating}%" stop-color="#ffc421"/>
            <stop offset="0%" stop-color="#fff"/></linearGradient>
        <path xmlns="http://www.w3.org/2000/svg" xmlns:bx="https://boxy-svg.com" d="M 914 464.436 L 915.345 468.199 L 919.439 468.281 L 916.176 470.688 L 917.362 474.501 L 914 472.226 L 910.638 474.501 L 911.824 470.688 L 908.561 468.281 L 912.655 468.199 Z" style="fill: url(#MyGradient{$rating}{$data.random});" transform="matrix(0.999955, 0.009434, -0.009434, 0.999955, -375.547333, -232.753937)" bx:shape="cube 914 470 5.719 5.564 0.4 5 1@5dc5808d"/>
        <path class="a" d="M 539.042 243.618 L 535.991 243.173 L 534.627 240.412 C 534.398 239.95 533.754 239.91 533.469 240.34 C 533.454 240.363 533.44 240.387 533.427 240.412 L 532.063 243.173 L 529.01 243.617 C 528.502 243.691 528.265 244.288 528.583 244.691 C 528.601 244.714 528.621 244.736 528.642 244.756 L 530.849 246.904 L 530.326 249.941 C 530.257 250.349 530.571 250.722 530.985 250.722 C 531.093 250.722 531.2 250.695 531.295 250.644 L 534.026 249.208 L 536.757 250.641 C 537.211 250.882 537.755 250.541 537.736 250.028 C 537.735 249.999 537.732 249.97 537.727 249.941 L 537.205 246.904 L 539.414 244.756 C 539.782 244.398 539.624 243.776 539.129 243.637 C 539.101 243.629 539.072 243.622 539.042 243.618 Z M 536.505 246.187 L 536.127 246.554 L 536.216 247.073 L 536.623 249.441 L 534.493 248.322 L 534.043 248.042 L 531.307 249.441 L 531.718 247.06 L 531.83 246.534 L 531.401 246.132 L 529.669 244.53 L 532.031 244.189 L 532.661 244.098 L 532.888 243.686 L 534.008 241.34 C 534.002 241.319 534.972 243.181 535.091 243.616 L 535.324 244.088 L 535.846 244.164 L 538.228 244.511 L 536.505 246.187 Z" style="fill: #ffc421;"/>
    </svg>
{/function}

{if $rating}
    <div class="rating_starts">
        {if $rating > 20}
            {render_star rating=100}
            {if $rating > 40}
                {render_star rating=100}
                {if $rating > 60}
                    {render_star rating=100}
                    {if $rating > 80}
                        {render_star rating=100}
                        {if $rating == 100}
                            {render_star rating=100}
                        {else}
                            {render_star rating=(100-$rating)/20*100}
                        {/if}
                    {else}
                        {render_star rating=(80-$rating)/20*100}
                        {render_star rating=0}
                    {/if}
                {else}
                    {render_star rating=(60-$rating)/20*100}
                    {render_star rating=0}
                    {render_star rating=0}
                {/if}
            {else}
                {render_star rating=(40-$rating)/20*100}
                {render_star rating=0}
                {render_star rating=0}
                {render_star rating=0}
            {/if}
        {else}
            {render_star rating=$rating/20*100}
            {render_star rating=0}
            {render_star rating=0}
            {render_star rating=0}
            {render_star rating=0}
        {/if}
    </div>
{/if}




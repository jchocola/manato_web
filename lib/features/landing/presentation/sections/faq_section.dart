import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:manato_web/core/widgets/section_title.dart';
import 'package:sizer/sizer.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(
          title: 'Frequently Asked Questions',
          subtitle: 'Everything you need to know.',
        ),

        Gap(5.w),

       FAQs(),
      ],
    );
  }
}

class FAQs extends StatelessWidget {
  const FAQs({super.key});

  @override
  Widget build(BuildContext context) {
    final faqs = [
      {
        'q': 'What is Manato?',
        'a':
            'Manato is an AI-powered platform that helps creators generate stunning images, artwork, and visual content in seconds using advanced artificial intelligence.',
      },
      {
        'q': 'How does the credit system work?',
        'a':
            'Each image generation consumes credits depending on the selected quality and generation settings. Credits are refreshed monthly based on your subscription plan.',
      },
      {
        'q': 'Can I use generated images commercially?',
        'a':
            'Yes, paid plans include commercial usage rights, allowing you to use generated images for business, marketing, social media, and client projects.',
      },
      {
        'q': 'Is my data secure?',
        'a':
            'Absolutely. All user data and generated content are securely encrypted and protected using modern security standards.',
      },
      {
        'q': 'How can I contact support?',
        'a':
            'You can contact our support team through live chat, email support, or the contact form available on our website.',
      },
      {
        'q': 'Do I need design experience?',
        'a':
            'No. Manato is designed for everyone, from beginners to professional designers and creators.',
      },
      {
        'q': 'Can I cancel my subscription anytime?',
        'a':
            'Yes, you can cancel your subscription at any time directly from your account settings.',
      },
      {
        'q': 'Does Manato support mobile devices?',
        'a':
            'Yes, Manato works on web, Android, and iOS devices for seamless creativity everywhere.',
      },
      {
        'q': 'How fast are image generations?',
        'a':
            'Most images are generated within a few seconds depending on server load and selected quality.',
      },
      {
        'q': 'Can I download images in high resolution?',
        'a':
            'Yes, premium plans allow downloading images in high-resolution formats suitable for professional use.',
      },
      {
        'q': 'Are there pre-made templates?',
        'a':
            'Yes, Manato offers a growing library of templates for social media, concept art, marketing, anime, photography, and more.',
      },
      {
        'q': 'Can I save my favorite creations?',
        'a':
            'Yes, you can save, organize, and revisit your favorite generated images anytime.',
      },
      {
        'q': 'Does Manato use the latest AI models?',
        'a':
            'Yes, we continuously update our AI models to provide higher quality, faster performance, and better customization.',
      },
      {
        'q': 'Can teams collaborate on projects?',
        'a':
            'Team collaboration features are available on business plans, allowing shared projects and team workspaces.',
      },
      {
        'q': 'Do unused credits roll over?',
        'a':
            'Unused credits may roll over depending on your subscription plan and account type.',
      },
      {
        'q': 'Can I generate anime-style artwork?',
        'a':
            'Yes, Manato supports multiple artistic styles including anime, realistic photography, 3D art, fantasy, and more.',
      },
      {
        'q': 'Is there a free trial available?',
        'a':
            'Yes, new users can start with a free plan or trial to explore Manato’s features before upgrading.',
      },
      {
        'q': 'What payment methods are supported?',
        'a':
            'We support major credit cards, PayPal, Apple Pay, Google Pay, and selected regional payment methods.',
      },
      {
        'q': 'Can I edit generated images?',
        'a':
            'Yes, you can customize prompts, regenerate variations, upscale images, and apply AI editing tools.',
      },
      {
        'q': 'Does Manato support API access?',
        'a':
            'API access is available for developers and businesses who want to integrate AI image generation into their apps or workflows.',
      },
      {
        'q': 'Can I use Manato for social media content?',
        'a':
            'Yes, many creators use Manato to generate Instagram posts, YouTube thumbnails, TikTok content, and marketing visuals.',
      },
      {
        'q': 'How often are new features added?',
        'a':
            'We regularly release updates, new templates, AI improvements, and creative tools based on community feedback.',
      },
      {
        'q': 'Can I organize projects into folders?',
        'a':
            'Yes, users can organize creations into collections and folders for easier management.',
      },
      {
        'q': 'What image formats are supported?',
        'a':
            'Generated images can be downloaded in popular formats including PNG, JPG, and WEBP.',
      },
      {
        'q': 'Does Manato support dark mode?',
        'a':
            'Yes, both the web and mobile applications support dark mode for a more comfortable experience.',
      },
      {
        'q': 'Can I generate multiple images at once?',
        'a':
            'Yes, batch generation is supported on premium plans for faster creative workflows.',
      },
      {
        'q': 'Will my prompts remain private?',
        'a':
            'Yes, your prompts and creations remain private unless you choose to share them publicly.',
      },
      {
        'q': 'Can I share my creations with the community?',
        'a':
            'Yes, Manato includes community features where creators can showcase and explore artworks.',
      },
      {
        'q': 'Is internet required to use Manato?',
        'a':
            'Yes, an internet connection is required because image generation happens on cloud AI servers.',
      },
      {
        'q': 'Does Manato support multiple languages?',
        'a':
            'Yes, multilingual support is available for prompts and the user interface.',
      },
    ];
    return ExpansionPanelList.radio(
      
      children: List.generate(faqs.length, (index) {
        final qa = faqs[index];
        return ExpansionPanelRadio(
          canTapOnHeader: true,
          value: index,
          headerBuilder: (context, isExpanded) => Padding(
            padding:  EdgeInsets.symmetric(vertical: 1.w , horizontal: 2.w),
            child: Text(qa['q'] as String),
          ),
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal:  5.w , vertical: 1.w),
            child: Text(qa['a'] as String),
          )
        );
      }),
    );
  }
}

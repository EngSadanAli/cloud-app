
import '../../Utils/app_images/app_images.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Co-Location",
    image: AppImages.onboradFrontimg,
    desc:
        "Cloud-Tribe Host your IT infrastructure in a safe environment, ensuring availability and connectivity for your business.",
  ),
  OnboardingContents(
    title: "Virtual Data Center",
    image: AppImages.onboarding1,
    desc:
        "Start your VDC subscription. Create your own VMs and other resources for a complete virtual data center.",
  ),
  OnboardingContents(
    title: "Ready Made Deployments",
    image: AppImages.onboradFrontimg,
    desc:
        "Select from our software deployments for your VDC. Each deployed service will create the resources it needs.",
  ),
  OnboardingContents(
    title: "Business Applications",
    image: AppImages.onborading2,
    desc:
        "Run your business completely in the cloud without any need for hardware, software licenses or periodic hardware or software updates.",
  ),
];











































